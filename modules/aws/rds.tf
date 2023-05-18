# DB Instances
resource "aws_db_instance" "rds_wp" {
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  identifier             = var.db_identifier
  username               = var.db_username
  password               = var.db_password
  instance_class         = var.db_instance_class
  storage_type           = var.db_storage_type
  allocated_storage      = 20
  vpc_security_group_ids = [aws_security_group.allow_data_in_db.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  publicly_accessible    = true
  db_name                = "wpdb"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true

}
