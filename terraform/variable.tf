variable "credentials" {
  description = "My Credentials"
  default     = "/workspaces/DE_Zoomcamp_module_1_docker_learning/terraform/keys/my_creds.json"
}

variable "project" {
  description = "Project"
  default     = "terraform-demo-448207"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default     = "US"
}


variable "bq_dataset_name" {
     description="My bigquery dataset name"
     default="demo_dataset"
}

variable "gcs_storage_class" {
    description ="bucket storage class"
    default="STANDARD"
}

variable "gcs_bucket_name" {
    description ="bucket storage name"
    default="terraform-demo-448207-terra-bucket"
}