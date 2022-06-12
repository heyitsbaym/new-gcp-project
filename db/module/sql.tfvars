module "sql" {
  source              = "../"
  name                = "databasesql"
  database_version    = "MYSQL_5_7"
  region              = "us-central1"
  zone                = "us-central1-c"
  tier                = "db-n1-standard-1"
  activation_policy   = "ALWAYS"
  availability_type   = "REGIONAL"
  disk_size           = 10
  disk_type           = "PD_SSD"
  db_name             = "wordpress"
  user_name           = "dbadmin"
  user_host           = "admin.com"
  user_password       = "changeme"
  deletion_protection = false
  allowed_hosts       = ["35.202.8.248"]
  root_password       = "ctea6hnvtmtm0GKr"
}


