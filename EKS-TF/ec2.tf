resource "aws_instance" "example" {
  ami           = "ami-0bff5d6c5f5b6d1e1" 
  instance_type = "t2.micro"

  tags = {
    Name = "Example"
  }

  vpc_security_group_ids = [aws_security_group.allow_ssh.id] 
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
