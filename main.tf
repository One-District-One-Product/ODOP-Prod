provider "aws" {
  region = "ap-south-1"
}

# Create a security group for the EC2 instance
resource "aws_security_group" "my_security_group" {
  name_prefix = "my-ec2-sg"

  # Define inbound rules to allow SSH (port 22) and HTTP (port 80) traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch an EC2 instance with provisioner "remote-exec"
resource "aws_instance" "my_ec2" {
  ami           = "ami-02e94b011299ef128"
  instance_type = "t2.micro"
  key_name      = "app-ssh-key-name" # Replace with your SSH key pair
  security_groups = [aws_security_group.my_security_group.name]
}

output "public_ip" {
  value = aws_instance.my_ec2.public_ip
}