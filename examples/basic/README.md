<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_instana_sensor_ecs"></a> [instana\_sensor\_ecs](#module\_instana\_sensor\_ecs) | ../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy resources in. | `string` | `"us-east-1"` | no |
| <a name="input_create_ecs_cluster"></a> [create\_ecs\_cluster](#input\_create\_ecs\_cluster) | Whether to create a new ECS cluster. | `bool` | `true` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Whether to create a new security group. | `bool` | `true` | no |
| <a name="input_ecs_cluster"></a> [ecs\_cluster](#input\_ecs\_cluster) | The ECS Cluster name where the Instana Sensor will be deployed. | `string` | `""` | no |
| <a name="input_instana_agent_endpoint"></a> [instana\_agent\_endpoint](#input\_instana\_agent\_endpoint) | The Instana Agent Endpoint for the Instana backend. | `string` | `"ingress-blue-saas.instana.io"` | no |
| <a name="input_instana_agent_key"></a> [instana\_agent\_key](#input\_instana\_agent\_key) | The Instana Agent Key for authentication with the Instana backend. | `string` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | The security group ID for the ECS service. | `string` | `""` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A list of subnet IDs for the ECS service. | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to provision the ECS service. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->