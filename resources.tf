# dans ce fichier nous allons déclarer les resources a créer, dans notre cas, il s'agid d'une instance, un VPC, un security group et une subnet

# dans ce bloc de code, nous allons créer une instance EC2, et indiquier ses spécifications
# certains elements ont été déclarés en tant que variables, le code cherchera leurs valeurs dans le fichier "terraform.tfvars" avec la commande -var-file="variables.tfvars"
resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id = aws_subnet.main.id
  
  tags = {
    Name = var.instance_name
  }
}

# dans ce bloc de code, nous allons créer un VPC et indiquer son nom "mon-vpc"
resource "aws_vpc" "mon-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "mon-vpc"
  }
}

# dans ce bloc de code, nous allons créer un security group nommé "allow_tls" dans notre subnet "mon-vpc"
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.mon-vpc.id
 
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.mon-vpc.cidr_block]
  }
 
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "allow_tls"
  }
}

# dans ce bloc de code, nous allons créer uns subnet dans notre vpc "mon-vpc"
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.mon-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}