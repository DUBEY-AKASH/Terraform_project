resource "aws_internet_gateway" "Project_IG" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "DevOps-igw"
    }
}