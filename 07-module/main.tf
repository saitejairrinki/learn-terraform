module "test" {
  source = "./local-module"
}

output "test" {
  value = module.test
}

