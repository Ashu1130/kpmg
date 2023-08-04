terraform {
  backend "s3" {
    bucket = "terraformbackend3"
    key    = "statefile/backend"
    region = "ap-south-1"
  }
}