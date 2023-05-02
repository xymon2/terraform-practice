terraform {
	
	required_version = ">= 0.13"

	backend "local" {
		path = "terraform.tfstate"
	}

	# backend "remote" {
	# 	hostname = "app.terraform.io"
	# 	organization = "beluga"
	# 	workspaces {
	# 		name = "test-dev"
	# 	}
	# }

	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = ">=4.65.0"
		}
	}
}