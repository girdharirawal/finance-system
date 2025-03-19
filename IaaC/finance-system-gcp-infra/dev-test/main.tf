module "kubernetes" {
  source       = "../modules/kubernetes"
  cluster_name = "dev-test-cluster"
  project_id   = var.project_id
  region       = var.region
}

module "storage" {
  source      = "../modules/storage"
  bucket_name = "dev-test-bucket"
  project_id  = var.project_id
  region      = var.region
}

module "iam" {
  source          = "../modules/iam"
  service_account = "dev-test-sa"
  project_id      = var.project_id
}