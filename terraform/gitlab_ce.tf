resource "yandex_compute_instance" "gitlab-kvitaly-ru" {
  name                      = "gitlab-kvitaly-ru"
  zone                      = "ru-central1-a"
  hostname                  = "gitlab-kvitaly-ru"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-2004}"
      name        = "root-gitlab-kvitaly-ru"
      #type        = "network-ssd"
      size        = "50"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.diploma-subnet-1.id}"
    nat       = true
    ip_address = "192.168.100.20"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

output "internal_ip_address_gitlab-kvitaly-ru" {
  value = yandex_compute_instance.gitlab-kvitaly-ru.network_interface.0.ip_address
}

output "external_ip_address_gitlab-kvitaly-ru" {
  value = yandex_compute_instance.gitlab-kvitaly-ru.network_interface.0.nat_ip_address
}