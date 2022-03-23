# Bonjour !

Bienvenue dans ce dépot de code d'une Generic Container Application Fortuneo !

Ce fichier README est là pour rappeller succintement ce qu'est une Generic Container Application, ainsi que pour fournir les liens vers des réferenciels documentaires à jour.

Vous pouvez (et généralement, devrez) modifier ce fichier pour y documenter l'application qui est developpée dans ce dépot de code. Ce fichier README est fourni à titre d'exemple utile.

___

## Generic Container Application

Une Generic Container Application est un produit fourni par la _Platform Team_ Fortuneo, permettant de développer et livrer des applications au format Docker.

Elle permet de prendre en charge:

* La construction de l'application (le _build_)
* Le déploiement de l'application en _dev_, puis en _prod_

### Qu'est ce que la Generic Container Application attend de vous?

Pour remplir correctement ses attributions, la Generic Container Application attend de vous plusieurs éléments: On parle de Contrat d'Interface.

Le contrat d'interface est le suivant.

* Le dépot de code doit pouvoir se construire en lançant la commande `docker build .`

  La configuration / selection d'outils / magie pour que `docker build .` puisse construire correctement l'application est à votre charge.

* L'application, une fois construite, doit écouter sur le réseau, en TCP, sur le port qui a été renseigné lors de la commande de cette Generic Container Application (80 par defaut).

* **Vous êtes responsables du contenu du fichier `Dockerfile`**. Le fichier livré avec ce dépot de code est un example que vous devrez remplacer.

* L'application doit être _stateless_.

  Elle peut (et va) redémarrer ou être recréée à tout moment, automatiquement, sans coordination.
  La seule garantie fournie étant qu'un noeud sera toujours présent pour traiter les requetes clientes. Tout état doit donc être persisté _en dehors_ de la Generic Container Application (DynamoDB, RDS, ... etc).

* **Vous êtes responsables de l'intégralité de ce dépot de code.**

  La Generic Container Application a besoin d'une configuration technique présente dans le dossier .infrastucture de ce dépot de code.
  Les valeurs par defaut sont généralement acceptables, mais si vous devez aller plus loin (configuration de Secrets, variables d'environnement, configuration de l'API Manager, ...etc), vous devez vous approprier ce format.
  **Vous êtes responsables de ces fichiers**.
  Les guides _Getting started_ de la Platform Team peuvent vous aider à experimenter et apprendre à manipuler ces fichiers, et la Platform Team peut également vous fournir de l'aide si nécéssaire.

___

## Réferenciels Documentaires

### Documentation Fortuneo Platform Team

* Generic Container Application:  https://gato.atlassian.net/wiki/spaces/FIT/pages/501579777/Generic+Container+Application

### Documentation AWS

* ECS: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html

### Documentation Communautaire

* Format du fichier Dockerfile: https://docs.docker.com/engine/reference/builder/
* Introduction à Docker: https://docs.docker.com/get-started/overview/# docker-alpine-sagemaker-base
