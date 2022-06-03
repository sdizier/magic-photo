resource "aws_dynamodb_table" "photos-table" {
  billing_mode   = "PROVISIONED"
  name           = "Photos"
  hash_key       = "PhotoId"
  range_key      = "Path"
  write_capacity = 10
  read_capacity  = 10

  attribute {
    name = "PhotoId"
    type = "S"
  }

  attribute {
    name = "Path"
    type = "S"
  }

  attribute {
    name = "Date"
    type = "S"
  }

  attribute {
    name = "Tags"
    type = "S"
  }

  global_secondary_index {
    name            = "PhotoDateIndex"
    hash_key        = "PhotoId"
    range_key       = "Date"
    projection_type = "ALL"
    write_capacity  = 10
    read_capacity   = 10
  }

  global_secondary_index {
    name            = "PhotoTagIndex"
    hash_key        = "PhotoId"
    range_key       = "Tags"
    projection_type = "ALL"
    write_capacity  = 10
    read_capacity   = 10
  }

}