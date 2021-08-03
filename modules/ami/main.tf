
resource "aws_instance" "web" {
  ami           = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
  user_data = file("${path.module}/user-data.sh")
#   vpc_security_group_ids = [aws_security_group.allow_ports.id]
 
  tags = {
    Name = "Image-Builder"
  }
}



output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}

resource "aws_ami_from_instance" "ami" {
  name               = "Drupalami"
  source_instance_id = aws_instance.web.id
  # provisioner "local-exec" {
  #   command = "terraform destroy -target aws_instance.web"
  # }
}

output "image_id" {
    value = aws_ami_from_instance.ami.id
}