terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


module "instana_sensor_ecs" {
  source = "../"

  instana_agent_key      = var.instana_agent_key
  instana_agent_endpoint = var.instana_agent_endpoint
  subnets                = var.subnets

  create_security_group = var.create_security_group
  security_group_id     = var.security_group_id

  create_ecs_cluster = var.create_ecs_cluster
  ecs_cluster        = var.ecs_cluster

  vpc_id = var.vpc_id

}
