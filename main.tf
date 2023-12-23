
module "myinframodule" {
    source = "./modules/basic-multiregion-infra"
  
}

module "vpcinfra"{
    source = "./modules/vpc-infra"
}

