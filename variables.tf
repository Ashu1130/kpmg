variable "cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "az" {
  default = ["ap-south-1a", "ap-south-1b"]
}
variable "Web_PUB_KEY" {
  default = "webkey.pub"
}

variable "Web_PRIV_KEY" {
  default = "webkey"
}
variable "rdsusename" {
  default = "rdsadmin"
}

variable "rdspass" {
  default = "adminpass"
}

variable "myip" {
  default = "192.168.59.1"
}