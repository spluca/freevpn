resource "aws_vpc" "freevpn_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "FreeVPN"
  }
}

resource "aws_subnet" "freevpn_subnet" {
  vpc_id            = aws_vpc.freevpn_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "FreeVPN"
  }
}

resource "aws_network_interface" "freevpn_interface" {
  subnet_id   = aws_subnet.freevpn_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "FreeVPN"
  }
}

