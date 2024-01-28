
resource "digitalocean_app" "laurcons-ro" {
  spec {
    name     = "laurcons-ro"
    region   = var.do_region.short
    features = ["buildpack-stack=ubuntu-22"]

    domain {
      name = digitalocean_domain.laurcons-ro.name
      zone = digitalocean_domain.laurcons-ro.name
    }

    alert {
      disabled = false
      rule     = "DEPLOYMENT_FAILED"
    }
    alert {
      disabled = false
      rule     = "DOMAIN_FAILED"
    }
    alert {
      disabled = false
      rule     = "DOMAIN_LIVE"
    }

    static_site {
      name             = "laurcons-ro-static"
      environment_slug = "html"
      source_dir       = "out"

      github {
        branch         = "build"
        deploy_on_push = true
        repo           = "Laurcons/laurcons-ro"
      }
    }

    # various redirects
    ingress {
      rule {
        component {
          name                 = "laurcons-ro-static"
          preserve_path_prefix = false
        }
        match {
          path {
            prefix = "/"
          }
        }
      }
      rule {
        match {
          path {
            prefix = "/sexy"
          }
        }
        redirect {
          authority     = "fb.com"
          port          = 0
          redirect_code = 302
          scheme        = "https"
          uri           = "/laurcons"
        }
      }
      rule {
        match {
          path {
            prefix = "/yt"
          }
        }
        redirect {
          authority     = "youtube.com"
          port          = 0
          redirect_code = 302
          scheme        = "https"
          uri           = "/channel/UCVhX8wUNuzXhCXVtMUhDzMA"
        }
      }
      rule {
        match {
          path {
            prefix = "/countdown"
          }
        }
        redirect {
          authority     = "static.laurcons.ro"
          port          = 0
          redirect_code = 302
          scheme        = "https"
        }
      }
      rule {
        match {
          path {
            prefix = "/files"
          }
        }
        redirect {
          authority     = "old.laurcons.ro"
          port          = 0
          redirect_code = 302
          scheme        = "http"
        }
      }
      rule {
        match {
          path {
            prefix = "/news"
          }
        }
        redirect {
          authority     = "old.laurcons.ro"
          port          = 0
          redirect_code = 302
          scheme        = "http"
        }
      }
      rule {
        match {
          path {
            prefix = "/old_pu"
          }
        }
        redirect {
          authority     = "old.laurcons.ro"
          port          = 0
          redirect_code = 302
          scheme        = "http"
          uri           = "/_pu"
        }
      }
    }
  }
}
