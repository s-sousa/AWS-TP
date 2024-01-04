### Lors de ce TP, j'ai rencontré une erreur au moment d'execution de mon code:


 Error: creating EC2 Instance: InvalidParameter: Security group sg-05ec7dd813a0d8694 and subnet subnet-00f4c1d17963772f6 belong to different networks.
       status code: 400, request id: c6c3780e-5824-4fbe-b423-4ed5aed2c5db

   with aws_instance.app_server,
   on resources.tf line 4, in resource "aws_instance" "app_server":
   4: resource "aws_instance" "app_server" {


J'ai donc dû rajouter un bloc de code a mon fichier ´resources.tf´ afin de créer un sous-réseau dans mon VPC. Suite a cette modification, mon code est passé sans aucun probléme.