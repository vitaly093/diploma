resource "yandex_compute_instance" "monitoring-kvitaly-ru" {
  name                      = "monitoring-kvitaly-ru"
  zone                      = "ru-central1-a"
  hostname                  = "monitoring-kvitaly-ru"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "fd8t9uorbd7qt1549d8k"
      name        = "root-monitoring-kvitaly-ru"
      #type        = "network-nvme"
      size        = "50"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.diploma-subnet-1.id}"
    #nat       = true
    ip_address = "192.168.100.30"
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}

output "internal_ip_address_monitoring-kvitaly-ru" {
  value = yandex_compute_instance.monitoring-kvitaly-ru.network_interface.0.ip_address
}

#output "external_ip_address_monitoring-kvitaly-ru" {
#  value = yandex_compute_instance.monitoring-kvitaly-ru.network_interface.0.nat_ip_address
#}