resource "local_file" "cat" {
  
  filename = var.filename
  #content = var.content["statment2"]
  content = "My favorite pet is ${random_pet.pet.id}"
  file_permission = "700"

}

resource "random_pet" "pet" {
  
  prefix = var.prefix[1]
  separator = var.seperator
  length = var.length["2"]
}

output pet-name {
  value = random_pet.pet.id
  description = "This output variable store values of pet id"

}