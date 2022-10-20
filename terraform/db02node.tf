resource "yandex_compute_instance" "db02-kvitaly-ru" {
  name                      = "db02-kvitaly-ru"
  zone                      = "ru-central1-b"
  hostname                  = "db02-kvitaly-ru"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-2004}"
      name        = "root-db02-kvitaly-ru"
      type        = "network-nvme"
      size        = "50"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.diploma-subnet-2.id}"
    nat       = true
    ip_address = "192.168.200.10"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

output "internal_ip_address_db02-kvitaly-ru" {
  value = yandex_compute_instance.db02-kvitaly-ru.network_interface.0.ip_address
}

output "external_ip_address_db02-kvitaly-ru" {
  value = yandex_compute_instance.db02-kvitaly-ru.network_interface.0.nat_ip_address
}
