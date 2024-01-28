
resource "digitalocean_vpc" "default-fra1" {
  name   = "default-fra1"
  region = var.do_region.full
}
