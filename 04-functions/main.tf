variable "fruits" {
  default = [ "apple", "banana"]
}

output "fruit" {
  //value = var.fruits[2]
  value  = element(var.fruits, 2)
}
