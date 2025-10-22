terraform {
required_providers {
aws = {
source  = "hashicorp/aws"     # pulls AWS provider plugin from HashiCorp registry
version = "6.16.0"            # locks provider version for consistency
}
}

backend "s3" {
bucket         = "locals-bukcet-for-pratise"   # S3 bucket name where .tfstate file will be stored
key            = "locals-lab"        # object name (path) for storing the state file
region         = "us-east-1"          # Particular region where S3 bucket is hosted
use_lockfile   = true                 # when i ran the command terraform apply, it will take some time to build the infra and at that time the state will be locked
encrypt        = true                 # the state file is fully secured like even in the AWS console there will no edit option as well
}
}

provider "aws" {
region = "us-east-1"                    # provider region for all AWS operations
}
