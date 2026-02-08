provider "aws" {
  region = "us-east-1"
}

# --- Jenkins Server Backend ---
resource "aws_s3_bucket" "jenkins_bucket" {
  bucket = "urtechmitra-jenkins-state-prod" # Changed to be unique

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "jenkins_lock" {
  name         = "Lock-Files"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# --- EKS Backend ---
resource "aws_s3_bucket" "eks_bucket" {
  bucket = "urtechmitra-eks-state" # Already created successfully

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "eks_lock" {
  name         = "urtechmitra-lock" # Import this using the command above
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}