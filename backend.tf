terraform {
  backend "s3" {
    bucket = "qa-cluster"
    key    = "terraform/state/db"
    access_key = "AKIA6AXTYJEUCYZBZTOV"
    secret_key = "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"
  }
}