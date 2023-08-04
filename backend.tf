terraform {
  backend "s3" {
    bucket = "backendkpmg"
    key    = "terraform/statefile"
    region = "ap-south-1"
  }
}