provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "6916d67c81b457eb0bd5cba958b50cfee937a646"
    git_file             = "terraform/simple_instance/s3.tf"
    git_last_modified_at = "2022-02-15 20:31:02"
    git_last_modified_by = "54961594+mansopluc@users.noreply.github.com"
    git_modifiers        = "54961594+mansopluc"
    git_org              = "mansopluc"
    git_repo             = "terragoat"
    yor_trace            = "8b17feb6-f68a-43fa-80a3-4419d5113ae5"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "6916d67c81b457eb0bd5cba958b50cfee937a646"
    git_file             = "terraform/simple_instance/s3.tf"
    git_last_modified_at = "2022-02-15 20:31:02"
    git_last_modified_by = "54961594+mansopluc@users.noreply.github.com"
    git_modifiers        = "54961594+mansopluc"
    git_org              = "mansopluc"
    git_repo             = "terragoat"
    yor_trace            = "db6fe90a-d2b6-4a1f-9f57-aa764300ca9c"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
