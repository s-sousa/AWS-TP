# providers.tf
# dans ce fichier nous declarons les providers qui nous souhaitons utiliser, dans ce cas il s'agit d'AWS
# les keys ont été configurées en utilisant la AWS CLI dans la machine qui éxecute ce code

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
#declaration du back-end S3 a utiliser pour notre infra, nous utilisons le bucket "bucketgipi" crée dans notre compte AWS   
    backend "s3" {
    bucket = "bucketgipi"
    key    = "tfstate/bucketgipi.tfstate"
    region = "eu-west-3"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-3"
}