data "aws_ami" "freevpn_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "foo" {
  ami           = "data.freevpn_ami.ubuntu.id"
  instance_type = "t2.micro"

  tags = {
    Name = "FreeVPN"
  }

  network_interface {
    network_interface_id = aws_network_interface.freevpn_interface.id
    device_index         = 0
  }
}

