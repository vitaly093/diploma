terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "diploma-terraform-state-backend"
    region     = "ru-central1"
    key        = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }

}

provider "yandex" {
  cloud_id  = "b1g2395348lsfc3abbpr"
  folder_id = "b1g3t8ebecrevrceh89n"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "diploma" {
  name = "diploma"
}

resource "yandex_vpc_subnet" "diploma-subnet-1" {
  name = "diploma-subnet-1"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.diploma.id}"
  v4_cidr_blocks = ["192.168.100.0/24"]
}

resource "yandex_vpc_subnet" "diploma-subnet-2" {
  name = "diploma-subnet-2"
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.diploma.id}"
  v4_cidr_blocks = ["192.168.200.0/24"]
}