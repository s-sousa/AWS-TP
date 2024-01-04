# Nous utilisons ce fichier pour déclarer certaines variables qui seront utilisés dans "resources.tf"
# Le nom de l'instance a créer, par défaut il sera "tf-aws-instance"
variable "instance_name" {
	description = "Name of the instance to be created"
	type = string
	default = "tf-aws-instance"
}
# Le type d'instance a créer, par défaut il sera "t2.micro"
variable "instance_type" {
	type = string
	default = "t2.micro"
}
# Le ID de l'AMI a utiliser dans l'instance, par défaut il sera "ami-0cc814d99c59f3789"
variable "ami_id" {
    description = "The AMI to use"
    type = string
    default = "ami-0cc814d99c59f3789"
}