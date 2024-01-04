# variables.tfvars
# Pour que ce fichier soit pris en compte, nous pouvons lancer la commande suivante "terraform apply -var-file="variables.tfvars"
# Ce fichier sert a regrouper toutes les variables a utiliser dans notre infra, et il permet de facilement les modifier en cas de besoin au moment d'execution sans devoir changer le code

instance_type = "t2.micro"
instance_name = "tf-aws-instance"
ami_id = "ami-02ea01341a2884771"