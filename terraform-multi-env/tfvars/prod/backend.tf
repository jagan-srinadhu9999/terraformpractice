    bucket = "remote-state-backend-tf"
    key    = "prod/tfvars-prod.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true # Enables S3 native locking