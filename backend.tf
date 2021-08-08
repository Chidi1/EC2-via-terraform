terraform {
  backend "s3" {
    bucket = "qa-cluster"
    key    = "terraform/state/db"
    access_key = "AKxxxxxxxxxxxxxxxxxxOV"
    secret_key = "KFxxxxxxxxxxxxxxtrr2h"
  }
}
