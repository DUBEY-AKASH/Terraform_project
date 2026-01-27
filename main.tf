resource "aws_instance" "app" {

    ami = var.ami_id
    instance_type = "t3.micro"
    subnet_id = aws_subnet.Public.id
    vpc_security_group_ids = [aws_security_group.Public_sg.id]
    key_name = var.key_name

    tags = {
      Name = "app-server"
    }
  
}

resource "aws_instance" "db" {

    ami = var.ami_id
    instance_type = "t3.micro"
    subnet_id = aws_subnet.private.id
    vpc_security_group_ids = [aws_security_group.Private_sg.id]
    key_name = var.key_name

    tags = {
      Name = "db-server"
    }
  
}