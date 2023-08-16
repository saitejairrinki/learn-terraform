variable "fruits" {
  default = [ "apple", "banana"]
}

output "fruit" {
  //value = var.fruits[2]
  value  = element(var.fruits, 2)
}

variable "fruit_with_stock" {
  default = {
    apple = {
      stock = 100
    }
  }
}

output "fruit_stock" {
 value  = try(var.fruit_with_stock["banana"], 0)
}

output "fruit_stock_price" {
  value  = lookup(var.fruit_with_stock["apple"], "price", 2)
        // try(var.fruit_with_stock["apple"].price, 2)
}

variable "components" {
  default = {
    frontend = { name = "frontend-dev"}
    catalogue = { name = "catalogue-dev" }
    mongodb = { name = "mongodb-dev"}
    user = { name = "user-dev"}
    redis = { name = "redis-dev"}
    cart = { name = "cart-dev"}
    mysql = { name = "mysql-dev" }
    shipping = { name = "shipping-dev"}
    payment = { name = "payment-dev"}
    rabbitmq = { name = "rabbitmq-dev"}
  }
}

  /* for_each = var.components
  name        = lookup(var.components, each.value["name"], null) */
output "private_record" {
  for_each = var.components
  value = lookup(var.components, each.value, null) 
}
  