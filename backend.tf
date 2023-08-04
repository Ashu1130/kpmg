terraform {
  backend "s3" {
    bucket = "backendkpmg"
    key    = "statefile"
    region = "ap-south-1"
  }
}