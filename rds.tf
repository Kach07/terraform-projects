# create database subnet group
# terraform aws db subnet group
resource "aws_db_subnet_group" "database_subnet_group" {
  name         = "database subnet"
  subnet_ids   = [aws_subnet.private_data_subnet_az1.id, aws_subnet.private_data_subnet_az2.id]
  description  = "subnets for database instance"

  tags   = {
    Name = "database subnets"
  }
}

# get the latest db snapshot
# terraform aws data db snapshot
data "aws_db_snapshot" "latest_db_snapshot" {
  db_snapshot_identifier = var.db_snapshot_identifier                                 # create a variable file 
  most_recent            = true                                                        # use the most recent snapshot of the rds database
  snapshot_type          = "manual"                                                     # meaning the snapshot was manually created
}

# create database instance restored from db snapshots
# terraform aws db instance
resource "aws_db_instance" "database_instance" {
  instance_class          = var.database_instance_class                                     # create a variable file
  skip_final_snapshot     = true                                                            # no snapshot when resources are destroyed
  availability_zone       = "eu-west-2b"
  identifier              = var.database_instance_identifier                                                           # create a varaible
  snapshot_identifier     = data.aws_db_snapshot.latest_db_snapshot.id
  db_subnet_group_name    = aws_db_subnet_group.database_subnet_group.name
  multi_az                = var.multi_az_deployment
  vpc_security_group_ids  = [aws_security_group.database_security_group.id]
}