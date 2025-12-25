module "backend" {
  source = "../../../modules/s3"

  bucket_name         = var.bucket_name
  dynamodb_table_name = var.dynamodb_table_name
}
