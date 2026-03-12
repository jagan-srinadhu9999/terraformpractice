    bucket = "remote-state-backend-tf"
    key    = "dev/tfvars-dev.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true # Enables S3 native locking