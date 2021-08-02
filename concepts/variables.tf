variable "filename" {
  default = "/root/terraform/cat.txt"
}

variable "content" {
  type = map
  default = {
      "statment1" = "This is local provider which create cat.txt !!!"
      "statment2" = "we love animals !!!"
  }
}

variable "prefix" {
 default = ["Mr", "Mrs", "Sir"]
 type = list 
}

variable "seperator" {
  default = "."
}

variable "length" {
  default = ["1", "2", "3"]
  type = list
}

