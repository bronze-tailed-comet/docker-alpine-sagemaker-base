FROM continuumio/miniconda3:4.10.3-alpine

USER root

ARG PYTHON_VERSION=3.7.10
ARG CONDA_PKG_VERSION=4.9.0
ARG PYARROW_VERSION=0.16.0
ARG MLIO_VERSION=0.1
ARG SKLEARN_VERSION=0.23.2

RUN apk update && \
    rm -rf /var/cache/apk/*

ENV PATH=/opt/conda/bin:${PATH}

RUN conda config --system --set auto_update_conda false && \
    conda config --system --set show_channel_urls true && \
    conda install -c conda-forge python=${PYTHON_VERSION} && \
    conda install conda=${CONDA_PKG_VERSION} && \
    conda update -y conda && \
    conda install -c conda-forge pyarrow=${PYARROW_VERSION} && \
    conda install -c mlio -c conda-forge mlio-py

# Python won’t try to write .pyc or .pyo files on the import of source modules
# Force stdin, stdout and stderr to be totally unbuffered. Good for logging.
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 PYTHONIOENCODING=UTF-8 LANG=C.UTF-8 LC_ALL=C.UTF-8

# Install Scikit-Learn; 0.20.0 supports both python 2.7+ and 3.4+
RUN pip install --no-cache -I scikit-learn==${SKLEARN_VERSION} retrying

LABEL com.amazonaws.sagemaker.capabilities.accept-bind-to-port=true

COPY requirements.txt /requirements.txt
RUN python -m pip install -r /requirements.txt && \
    rm /requirements.txt

COPY sagemaker_sklearn_container-2.0-py3-none-any.whl /sagemaker_sklearn_container-2.0-py3-none-any.whl
# https://github.com/googleapis/google-cloud-python/issues/6647
RUN pip install --no-cache /sagemaker_sklearn_container-2.0-py3-none-any.whl && \
    rm /sagemaker_sklearn_container-2.0-py3-none-any.whl

# RUN rm -rf /opt/conda/lib/python3.7/site-packages/numpy-1.19.4.dist-info && \
#     pip install --no-cache /sagemaker_sklearn_container-2.0-py3-none-any.whl && \
#     rm /sagemaker_sklearn_container-2.0-py3-none-any.whl