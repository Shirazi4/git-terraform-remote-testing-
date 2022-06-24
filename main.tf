variable "region" {
  default = "us-west-2"
}

variable "domain_name" {
  default = "mikeball.me"
}

provider "aws" {
  region = "${var.region}"
}

resource "aws_s3_bucket" "site" {
  bucket = "${var.domain_name}"
  region = "${var.region}"
  acl = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }