variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "public_subnet2_cidr_block" {
  default = "10.0.2.0/24"
}

variable "private_subnet_cidr_block" {
  default = "10.0.3.0/24"
}

variable "private_subnet2_cidr_block" {
  default = "10.0.4.0/24"
}

variable "public_subnet_ids" {
  default = ["subnet-1234567890", "subnet-0987654321"]
}

variable "db_engine" {
  default = "mysql"
}

variable "db_engine_version" {
  default = "5.7"
}

variable "db_identifier" {
  default = "wordpress-db"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "admin123"
}

variable "db_instance_class" {
  default = "db.t2.micro"
}

variable "db_storage_type" {
  default = "gp2"
}

variable "db_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_1_cidr" {
  default = "10.0.2.0/24"
}

variable "public_subnet_2_cidr" {
  default = "10.0.3.0/24"
}

variable "db_subnet_group_name" {
  default = "wordpress-db-subnet"
}

variable "private_route_table_name" {
  default = "private"
}

variable "public_route_table_name" {
  default = "public"
}

variable "private_network_acl_name" {
  default = "private"
}