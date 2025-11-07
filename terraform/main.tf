terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}


resource "local_file" "vm_simulation" {
  content  = <<EOT
Instance fictive simulée :
- Nom : pfe-sample-vm
- Type : t3.micro
- Région : eu-west-1
EOT
  filename = "vm_simulation.txt"
}
