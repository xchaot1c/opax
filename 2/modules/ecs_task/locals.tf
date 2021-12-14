locals {
  rendered_ports       = [for v in data.template_file.ports : v.rendered]
  rendered_mounts      = [for v in data.template_file.mounts : v.rendered]
}