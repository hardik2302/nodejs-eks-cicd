terraform {
  backend "s3" {
    bucket = "backendterraform-state"
    key    = "kubernates-ci/cd"
    region = "ap-south-1"
  }
}