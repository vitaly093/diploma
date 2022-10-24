resource "yandex_compute_instance" "app-kvitaly-ru" {
  name                      = "app-kvitaly-ru"
  zone                      = "ru-central1-a"
  hostname                  = "app-kvitaly-ru"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-2004}"
      name        = "root-app-kvitaly-ru"
      type        = "network-ssd"
      size        = "50"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.diploma-subnet-1.id}"
    #nat       = true
    ip_address = "192.168.100.15"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

output "internal_ip_address_app-kvitaly-ru" {
  value = yandex_compute_instance.app-kvitaly-ru.network_interface.0.ip_address
}

#output "external_ip_address_app-kvitaly-ru" {
#  value = yandex_compute_instance.app-kvitaly-ru.network_interface.0.nat_ip_address
#}