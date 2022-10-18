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