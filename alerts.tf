
resource "digitalocean_monitor_alert" "cpu" {
  description = "CPU is running high"

  window  = "30m"
  type    = "v1/insights/droplet/cpu"
  value   = "70"
  compare = "GreaterThan"

  alerts {
    email = ["laurcons@outlook.com"]
  }

  entities = [
    digitalocean_droplet.droplet1.id
  ]
}
