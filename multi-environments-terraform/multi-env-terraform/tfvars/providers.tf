terraform {
required_providers {
aws = {
source  = "hashicorp/aws"     # pulls AWS provider plugin from HashiCorp registry
version = "6.16.0"            # locks provider version for consistency
}
}

backend "s3" {                # the state file is fully secured like even in the AWS console there will no edit option as well


}
}

provider "aws" {
region = "us-east-1"                    # provider region for all AWS operations
}
