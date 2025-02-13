# Resource: EC2 Instance
resource "aws_instance" "ec2" {
  ami = "ami-04681163a08179f29"
  vpc_security_group_ids = var.security_ids
  instance_type = "t2.micro"
  key_name = "dev"

  # User Data Script to Install Apache
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "<h1>Welcome to My Terraform Web Server</h1>" | sudo tee /var/www/html/index.html
  EOF

  
  tags = {
    "Name" = "EC2 Instance"
  }
}

output "instance_id" {
  value = aws_instance.ec2.id
}

output "instance_public_ip" {
  value = aws_instance.ec2.public_ip
}