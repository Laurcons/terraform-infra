
resource "digitalocean_droplet" "droplet1" {
  name              = "droplet1"
  image             = "84780478" # seems unsupported in Terraform/DO API
  size              = "s-1vcpu-2gb"
  graceful_shutdown = false
}
