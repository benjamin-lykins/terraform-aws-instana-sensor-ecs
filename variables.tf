###
# Network Variables
###

variable "vpc_id" {
  description = "The VPC ID to provision the ECS service."
  type        = string
}

variable "subnets" {
  description = "A list of subnet IDs for the ECS service."
  type        = list(string)
}

###
# ECS Variables
###

variable "create_ecs_cluster" {
  description = "Whether to create a new ECS cluster."
  type        = bool
  default     = true


  validation {
    condition     = var.create_ecs_cluster || var.ecs_cluster != ""
    error_message = "If 'create_ecs_cluster' is false, 'ecs_cluster' must be provided."
  }
}

variable "ecs_cluster" {
  description = "The ECS Cluster name where the Instana Sensor will be deployed."
  type        = string
  default     = ""
}

variable "create_security_group" {
  description = "Whether to create a new security group."
  type        = bool
  default     = true

  validation {
    condition     = var.create_security_group || var.security_group_id != ""
    error_message = "If'create_security_group' is false, 'security_group_id' must be provided."
  }
}

variable "security_group_id" {
  description = "The security group ID for the ECS service."
  type        = string
  default     = ""
}

###
# Instana Variables
###

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




