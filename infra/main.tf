# Create new storage bucket in the US multi-region
# with standard storage
provider "google" {
  project     = "uaap-season-86-dp"
  region      = "asia-southeast1"
}

resource "google_storage_bucket" "static" {
 name          = "resume-bucket-keen"
 location      = "ASIA"
 storage_class = "STANDARD"

 uniform_bucket_level_access = true
}

# Upload a text file as an object
# to the storage bucket

resource "google_storage_bucket_object" "default" {
 name         = "resume.pdf"
 source       = "resume.pdf"
 content_type = "application/pdf"
 bucket       = google_storage_bucket.static.id
}