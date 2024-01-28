
resource "digitalocean_domain" "laurcons-ro" {
  name = "laurcons.ro"
}

resource "digitalocean_domain" "bubday-ro" {
  name = "bubday.ro"
}

# DNS records are not maintained here, they are too many