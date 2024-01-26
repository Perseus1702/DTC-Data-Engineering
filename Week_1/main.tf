# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
terraform {
  /* Uncomment this block to use Terraform Cloud for this tutorial
  cloud {
      organization = "perseus1702"
      workspaces {
        name = "learn-terraform-import"
      }
  }
  */

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

# week_1_default 43894736a3978fc627cc67c0fc0aeb3457e52f59ecb1569950083b5cc3f227c8
import {
  id = "43894736a3978fc627cc67c0fc0aeb3457e52f59ecb1569950083b5cc3f227c8"
  to = docker_network.wk1_network
}

# pg-database 776ce6a11b25b69a558a3d27cdaaca9633fe4d3a7b52c7894cbb21f233dfbb0c
import {
  id = "776ce6a11b25b69a558a3d27cdaaca9633fe4d3a7b52c7894cbb21f233dfbb0c"
  to = docker_container.pg-database
}

# pg-admin 6a57dfbf56d79dc03af9faabac8258e9fbd0cb88d842fac9c65b1bf63387a481
import {
  id = "6a57dfbf56d79dc03af9faabac8258e9fbd0cb88d842fac9c65b1bf63387a481"
  to = docker_container.pg-admin
}

# resource "docker_container" "week_1-pgdatabase-1" {
#   image=0b8b9a62716c0dd10518c57099bb5036e1981ff67e0ac4be80021ffa63aa4143
#   name         = "nginx:latest"
#   keep_locally = false
#  }
# 

# resource "docker_container" "" {
#   image = docker_image.nginx.image_id
#   name  = "tutorial"
#   ports {
#     internal = 80
#     external = 8000
#   }
#   # pg-admin 6a57dfbf56d79dc03af9faabac8258e9fbd0cb88d842fac9c65b1bf63387a481
# }
