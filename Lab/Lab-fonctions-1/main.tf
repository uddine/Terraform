locals {
  ceil_number = ceil(6.4)
  #lowest_number = min(10, 24, 4)
}

resource "random_pet" "server_name" {
     length = local.ceil_number
     #length = local.lowest_number
}

output "random_pet" {
  value = random_pet.server_name.id
}