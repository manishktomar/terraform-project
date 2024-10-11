resource "aws_db_instance" "main" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.instance_class
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name = var.db_subnet_group
}
