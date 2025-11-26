variable "vpc_id" {
  description = "The VPC ID to provision the ECS service."
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "instana_agent_key" {
  description = "The Instana Agent Key for authentication with the Instana backend."
  type        = string
  sensitive   = true
}

variable "instana_agent_endpoint" {
  description = "The Instana Agent Endpoint for the Instana backend."
  type        = string
  default     = "ingress-blue-saas.instana.io"
}

variable "create_ecs_cluster" {
  description = "Whether to create a new ECS cluster."
  type        = bool
  default     = true
}

variable "ecs_cluster" {
  description = "The ECS Cluster name where the Instana Sensor will be deployed."
  type        = string
  default     = ""
}

variable "subnets" {
  description = "A list of subnet IDs for the ECS service."
  type        = list(string)
}

variable "create_security_group" {
  description = "Whether to create a new security group."
  type        = bool
  default     = true
}

variable "security_group_id" {
  description = "The security group ID for the ECS service."
  type        = string
  default     = ""
}
