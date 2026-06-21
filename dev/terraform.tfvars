environment         = "dev"
aws_region          = "us-east-1"
availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_cidr            = "10.0.0.0/16"
ec2_key_name        = ""
allowed_ssh_cidrs   = ["0.0.0.0/0"]
public_instance_type  = "t3.micro"
private_instance_type = "t3.micro"
db_password         = "ChangeMeDev123!"
app_bucket_name     = "my-project-dev-app-bucket"
tags = {
  Environment = "dev"
  Project     = "my-project"
}
