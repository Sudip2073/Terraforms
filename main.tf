provider "aws" { 
    region     = "us-east-1" 
    #access_key = ""                                                                                     
    #secret_key = ""
    shared_credentials_files = ["C:/Users/King/.aws/credentials"]
}

resource "aws_instance" "example" {
    ami           = "ami-08c40ec9ead489470"
    instance_type = "t2.micro"
    key_name = "Sudip"
    tags =    { 
            Name= "Master_ansible"
        }
    vpc_security_group_ids=[aws_security_group.main.id]
}


resource "aws_security_group" "main" { 
// To Allow SSH Transport
    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }

    // To Allow Port 80 Transport

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}