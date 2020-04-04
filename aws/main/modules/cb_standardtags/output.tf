output "coralbuffalo_common_tags_output" {
  value = "${map(
    "Organization", "${var.Organization}",
    "Owner", "${var.Owner}",
    "Application", "${var.Application}",
    "Environment", "${var.Environment}",
    "SnapshotEnabled", "${var.SnapshotEnabled}",
    "AppVersion", "${var.AppVersion}",
    "TaggingVersionID", "${var.TaggingVersionID}"
    )
  }"
}

output "Organization" {
  value = "${var.Organization}"
}

output "Owner" {
  value = "${var.Owner}"
}

output "Application" {
  value = "${var.Application}"
}

output "Environment" {
  value = "${var.Environment}"
}

output "SnapshotEnabled" {
  value = "${var.SnapshotEnabled}"
}

output "AppVersion" {
  value = "${var.AppVersion}"
}

output "TaggingVersionID" {
  value = "${var.TaggingVersionID}"
}