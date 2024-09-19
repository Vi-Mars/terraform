locals {
  db_local_name = "${var.vm_db_name}-${var.default_zone_db}"
  web_local_name = "${var.vm_web_name}-${var.default_zone}"
}
