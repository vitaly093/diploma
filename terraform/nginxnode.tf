resource "yandex_compute_instance" "kvitaly-ru" {
  name                      = "kvitaly-ru"
  zone                      = "ru-central1-a"
  hostname                  = "kvitaly.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-2004}"
      name        = "root-kvitaly-ru"
      type        = "network-ssd"
      size        = "50"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.diploma-subnet-1.id}"
    nat       = true
    nat_ip_address = "178.154.204.80"
    ip_address = "192.168.100.8"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

output "internal_ip_address_kvitaly-ru" {
  value = yandex_compute_instance.kvitaly-ru.network_interface.0.ip_address
}

output "external_ip_address_kvitaly-ru" {
  value = yandex_compute_instance.kvitaly-ru.network_interface.0.nat_ip_address
}
