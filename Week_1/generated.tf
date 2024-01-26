# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "6a57dfbf56d79dc03af9faabac8258e9fbd0cb88d842fac9c65b1bf63387a481"
resource "docker_container" "pg-admin" {
  attach                                      = null
  cgroupns_mode                               = null
  command                                     = []
  container_read_refresh_timeout_milliseconds = null
  cpu_set                                     = null
  cpu_shares                                  = 0
  destroy_grace_seconds                       = null
  dns                                         = []
  dns_opts                                    = []
  dns_search                                  = []
  domainname                                  = null
  entrypoint                                  = ["/entrypoint.sh"]
  env                                         = []
  gpus                                        = null
  group_add                                   = []
  hostname                                    = "6a57dfbf56d7"
  image                                       = "sha256:76a6f90958250e4e99d4e4973a7f455aaf6abc5ae222b4cc8c83bb2fb7088126"
  init                                        = false
  ipc_mode                                    = "private"
  log_driver                                  = "json-file"
  log_opts                                    = {}
  logs                                        = null
  max_retry_count                             = 0
  memory                                      = 0
  memory_swap                                 = 0
  must_run                                    = null
  name                                        = "week_1-pgadmin-1"
  network_mode                                = "week_1_default"
  pid_mode                                    = null
  privileged                                  = false
  publish_all_ports                           = false
  read_only                                   = false
  remove_volumes                              = null
  restart                                     = null
  rm                                          = false
  runtime                                     = "runc"
  security_opts                               = []
  shm_size                                    = 64
  start                                       = null
  stdin_open                                  = false
  stop_signal                                 = null
  stop_timeout                                = 0
  storage_opts                                = {}
  sysctls                                     = {}
  tmpfs                                       = {}
  tty                                         = false
  user                                        = "pgadmin"
  userns_mode                                 = null
  wait                                        = null
  wait_timeout                                = null
  working_dir                                 = "/pgadmin4"
  ports {
    external = 8080
    internal = 80
    ip       = "0.0.0.0"
    protocol = "tcp"
  }
}

# __generated__ by Terraform from "776ce6a11b25b69a558a3d27cdaaca9633fe4d3a7b52c7894cbb21f233dfbb0c"
resource "docker_container" "pg-database" {
  attach                                      = null
  cgroupns_mode                               = null
  command                                     = ["postgres"]
  container_read_refresh_timeout_milliseconds = null
  cpu_set                                     = null
  cpu_shares                                  = 0
  destroy_grace_seconds                       = null
  dns                                         = []
  dns_opts                                    = []
  dns_search                                  = []
  domainname                                  = null
  entrypoint                                  = ["docker-entrypoint.sh"]
  env                                         = []
  gpus                                        = null
  group_add                                   = []
  hostname                                    = "776ce6a11b25"
  image                                       = "sha256:0b8b9a62716c0dd10518c57099bb5036e1981ff67e0ac4be80021ffa63aa4143"
  init                                        = false
  ipc_mode                                    = "private"
  log_driver                                  = "json-file"
  log_opts                                    = {}
  logs                                        = null
  max_retry_count                             = 0
  memory                                      = 0
  memory_swap                                 = 0
  must_run                                    = null
  name                                        = "week_1-pgdatabase-1"
  network_mode                                = "week_1_default"
  pid_mode                                    = null
  privileged                                  = false
  publish_all_ports                           = false
  read_only                                   = false
  remove_volumes                              = null
  restart                                     = null
  rm                                          = false
  runtime                                     = "runc"
  security_opts                               = []
  shm_size                                    = 64
  start                                       = null
  stdin_open                                  = false
  stop_signal                                 = "SIGINT"
  stop_timeout                                = 0
  storage_opts                                = {}
  sysctls                                     = {}
  tmpfs                                       = {}
  tty                                         = false
  user                                        = null
  userns_mode                                 = null
  wait                                        = null
  wait_timeout                                = null
  working_dir                                 = null
  ports {
    external = 5432
    internal = 5432
    ip       = "0.0.0.0"
    protocol = "tcp"
  }
}

# __generated__ by Terraform from "43894736a3978fc627cc67c0fc0aeb3457e52f59ecb1569950083b5cc3f227c8"
resource "docker_network" "wk1_network" {
  attachable      = false
  check_duplicate = null
  driver          = "bridge"
  ingress         = false
  internal        = false
  ipam_driver     = "default"
  ipam_options    = {}
  ipv6            = false
  name            = "week_1_default"
  options         = {}
  ipam_config {
    aux_address = {}
    gateway     = "172.21.0.1"
    ip_range    = null
    subnet      = "172.21.0.0/16"
  }
  labels {
    label = "com.docker.compose.network"
    value = "default"
  }
  labels {
    label = "com.docker.compose.project"
    value = "week_1"
  }
  labels {
    label = "com.docker.compose.version"
    value = "2.23.3"
  }
}
