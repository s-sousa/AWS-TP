# AWS TP - CAPGIPI6
**Author: Sergio ESTEVES DE SOUSA**

---

# Terraform AWS Infrastructure Setup

Ce code Terraform vise à créer une infrastructure AWS comprenant : une instance EC2 de type t2.micro, un VPC, une subnet et un groupe de sécurité. Le code est organisé en différents fichiers pour plus de clarité et de modularité.

Le code est organisé dans les fichiers suivants:

- main.tf
- resources.tf
- variables.tf
- variables-tp.tfvars

## Overview des fichiers

### main.tf

**Objectif:**
- Déclarer les providers à utiliser (AWS dans ce cas) et les configurer, ainsi que déclarer le backend S3 à utiliser.

**Détails:**
- Configure le provider AWS avec les credentials nécessaires.
- Déclare le backend S3 à utiliser (bucketgipi) pour sauvegarder le Terraform state.

### resources.tf

**Objectif:**
- Définir les ressources AWS à créer, comprenant une instance EC2 de type t2.micro, un VPC "mon-vpc", une subnet dans ce VPC et un groupe de sécurité "allow_tls".

**Détails:**
- Création d'une instance EC2 dans la subnet et le groupe de sécurité, avec l'AMI désirée et le type d'instance choisi.
- Création d'un VPC nommé "mon-vpc".
- Création d'un groupe de sécurité nommé "allow_tls".
- Création d'une subnet dans le VPC "mon-vpc".

### variables.tf

**Objectif:**
- Déclaration des variables utilisées dans notre code Terraform afin de le rendre plus flexible et modulaire.

**Détails:**
- `instance_name` : nom de l'instance EC2 à créer, par défaut "tf-aws-instance".
- `instance_type` : type d'instance EC2 à créer, par défaut "t2.micro".
- `ami_id` : ID de l'AMI à utiliser dans l'instance EC2, par défaut "ami-0cc814d99c59f3789".

### variables-tp.tfvars

**Objectif:**
- Fournir les valeurs à utiliser dans "variables.tf".

**Détails:**
- Permet la modification des valeurs de variables sans avoir à changer le code Terraform pour le rendre plus modulaire et réutilisable pour différents besoins.

## Commencement

1. **Prerequisites**: Installation de Terraform dans la machine, ainsi que l'installation de la AWS CLI et sa configuration avec les keys d'acces.
2. **Configuration**: Mise a jour des variables dans `variables-tp.tfvars` si nécessaire pour la configuration souhaitée.
3. **Execution**:
 - terraform init
 - terraform apply -var-file="variables-tp.tfvars"

## Notes

- Ce code est designé a la création de resources dans la region AWS "eu-west-3". La region peut être modifié dans les fichiers `main.tf` and `resources.tf`

