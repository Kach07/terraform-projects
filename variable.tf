#vpc variables
variable "vpc_cidr" {
    default     = "10.0.0.0/16"
    description = "vpc cidr block"
    type        = string
}

variable "public_subnet_az1_cidr" {
    default     = "10.0.0.0/24"
    description = "public subnet az1 cidr block"
    type        = string
}

variable "public_subnet_az2_cidr" {
    default     = "10.0.1.0/24"
    description = "public subnet az2 cidr block"
    type        = string
}

variable "private_app_subnet_az1_cidr" {
    default     = "10.0.2.0/24"
    description = "private app subnet az1 cidr block"
    type        = string
}

variable "private_app_subnet_az2_cidr" {
    default     = "10.0.3.0/24"
    description = "private app subnet az2 cidr block"
    type        = string
}

variable "private_data_subnet_az1_cidr" {
    default     = "10.0.4.0/24"
    description = "private data subnet az1 cidr block"
    type        = string
}

variable "private_data_subnet_az2_cidr" {
    default     = "10.0.5.0/24"
    description = "private data subnet az2 cidr block"
    type        = string
}

# security group variables
variable "ssh_location" {
    default     = "0.0.0.0/0"
    description = "the ip address that can ssh into the ec2 instance"
    type        = string
}

# rds variable
variable "db_snapshot_identifier" {
    default     = "arn:aws:rds:eu-west-2:268852027051:snapshot:kachi-rds-db-snapshot"
    description = "the database snapshot arn"
    type        = string
}

# rds variable
variable "database_instance_class" {
    default     = "db.t2.micro"
    description = "the database instance type"
    type        = string
}

# rds variable
variable "database_instance_identifier" {
    default     = "kachi-rds-db"
    description = "the database instance identifier"
    type        = string
}

# rds variable
variable "multi_az_deployment" {
    default     = false
    description = "create a standby db instance in another AZ"
    type        = bool
}

# application Load balancer variables
variable "ssl_certificate_arn" {
    default     = "arn:aws:acm:eu-west-2:268852027051:certificate/1dc4647c-716c-443b-8590-6c716ee90091"  # get from management console 
    description = "ssl certificate arn"
    type        = string
}
