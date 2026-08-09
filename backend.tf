terraform {
  backend "s3" {
    bucket = "health-terraform-state-268810574052"

    key = "health/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true

    use_lockfile = true
  }
}