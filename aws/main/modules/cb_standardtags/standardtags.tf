variable "Organization" {
  description = "What organization is this for (Infrastructure, Analytics, Enterprise Apps)"
  type = "string"
}

variable "Owner" {
  description = "What group is responsible for this."
  type = "string"
}

variable "Application" {
  description = "What overall application is this for."
  type = "string"
}

variable "Environment" {
  description = "Production, Development, Test"
  type = "string"
}

variable "SnapshotEnabled" {
  description = "Should snapshotting be enabled."
  type = "string"
}

variable "AppVersion" {
  description = "What version of the application is this for."
  type = "string"
}

variable "TaggingVersionID" {
  description = "What version of tags is this using."
  type = "string"
}
