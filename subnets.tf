resource "aws_subnet" "Public" {
    cidr_block = var.public_subnet_cidr
    vpc_id = aws_vpc.main.id
    map_public_ip_on_launch = true
    availability_zone = "eu-north-1a"

    tags = {
      Name = "Public_subnet"
    }
  
}

resource "aws_subnet" "private" {
    cidr_block = var.private_subnet_cidr
    vpc_id = aws_vpc.main.id
    map_public_ip_on_launch = true
    availability_zone = "eu-north-1b"

    tags = {
      Name = "Private_subnet"
    }
  
}