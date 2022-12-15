variable "VenturaProdVpcPara" {
  default = "10.0.0.0/16"
  description = "VPC CIDR Block"
  type = string
}

variable "VenturaProdNATALBSN1Para" {
  default = "10.0.1.0/28"
  description = "VenturaProdNATALBSN1 CIDR Block"
  type = string
}

variable "VenturaProdNATALBSN2Para" {
  default = "10.0.3.0/28"
  description = "VenturaProdNATALBSN2 CIDR Block"
  type = string
}

variable "VenturaProdWebSN1Para" {
  default = "10.0.4.0/23"
  description = "VenturaProdWebSN1 CIDR Block"
  type = string
}

variable "VenturaProdWebSN2Para" {
  default = "10.0.10.0/23"
  description = "VenturaProdWebSN2 CIDR Block"
  type = string
}

variable "VenturaProdAPPSN1Para" {
  default = "10.0.14.0/23"
  description = "VenturaProdAPPSN1 CIDR Block"
  type = string
}

variable "VenturaProdAPPSN2Para" {
  default = "10.0.20.0/23"
  description = "VenturaProdAPPSN2 CIDR Block"
  type = string
}

variable "VenturaProdDBSN1Para" {
  default = "10.0.25.0/27"
  description = "VenturaProdDBSN1 CIDR Block"
  type = string
}

variable "VenturaProdDBSN2Para" {
  default = "10.0.30.0/27"
  description = "VenturaProdDBSN2 CIDR Block"
  type = string
}

variable "ssh-location" {
  default = "0.0.0.0/0"
  description = "IP Address that can SSH into EC2 Instance "
  type = string
}

variable "database-snapshot-identifier" {
  default = "arn:aws:rds:us-east-1:570390153539:snapshot:rds-snapshot-databaseinstance-v7ueyvh0sce5"
  description = "Database Snapshot ARN"
  type = string
}

variable "database-instance-class" {
  default = "db.t2.micro"
  description = "Database Instance Type"
  type = string
}

variable "database-instance-identifier" {
  default = "mysqldb"
  description = "Database Instance Identifier"
  type = string
}

variable "multi-az-deployment" {
  default = false
  description = "Create a Standby Database Instance"
  type = bool
}