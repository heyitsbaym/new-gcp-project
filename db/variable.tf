variable "name" {
  description = "The name of the Cloud SQL resources"
  type        = string
}

#required
variable "database_version" {
  description = "The database version to use"
  type        = string
}

#required
variable "region" {
  description = "The region of the Cloud SQL resources"
  type        = string
}

#Master
variable "tier" {
  description = "The tier for the master instance."
  type        = string
  default     = "db-n1-standard-1"
}

variable "zone" {
  description = "The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`."
  type        = string
}

variable "activation_policy" {
  description = "The activation policy for the master instance. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`."
  type        = string
}

variable "availability_type" {
  description = "The availability type for the master instance. Can be either `REGIONAL` or `null`."
  type        = string
  default     = "REGIONAL"
}

variable "disk_size" {
  description = "The disk size for the master instance"
  type        = number
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
}

variable "db_name" {
  description = "The name of the default database to create"
  type        = string
}

variable "user_name" {
  description = "The name of the default user"
  type        = string
}

variable "user_host" {
  description = "The host for the default user"
  type        = string
}

variable "user_password" {
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
  type        = string
}

variable "deletion_protection" {
  description = "Used to block Terraform from deleting a SQL Instance."
  type        = bool
}

variable "allowed_hosts" {
  description = "Ip address allowed to connect to DB"
  type        = list
}

variable "root_password" {
  description = "root_password to connect to DB"
  type        = string
}