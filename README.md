## Terraform AWS Instana Sensor ECS Module

Using this module, you can deploy the Instana Sensor on an ECS cluster using Fargate launch type.

## How to use this Module

There is an example usage of this module in the `example/` directory. Which you can refer to for guidance on how to use this module in your own Terraform configuration.

### Prerequisites

- An AWS account with necessary permissions to create ECS clusters, services, task definitions, IAM roles, and security groups.
- AWS VPC and subnets where the ECS service will be deployed.
- An Instana account with an Agent Key for authentication.

#### Optional

- If there is an existing ECS cluster and security group(s) you wish to use, you can provide their identifiers as inputs to the module.
- By default, the module will create a new ECS cluster and security group if not provided.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.instana_sensor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.instana_sensor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.instana_sensor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_policy.instana_sensor_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.instana](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.instana_sensor_role_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group.instana_sensor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ecs_cluster.instana_sensor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecs_cluster) | data source |
| [aws_iam_policy_document.instana_sensor_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_security_group.instana_sensor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_ecs_cluster"></a> [create\_ecs\_cluster](#input\_create\_ecs\_cluster) | Whether to create a new ECS cluster. | `bool` | `true` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Whether to create a new security group. | `bool` | `true` | no |
| <a name="input_ecs_cluster"></a> [ecs\_cluster](#input\_ecs\_cluster) | The ECS Cluster name where the Instana Sensor will be deployed. | `string` | `""` | no |
| <a name="input_instana_agent_endpoint"></a> [instana\_agent\_endpoint](#input\_instana\_agent\_endpoint) | The Instana Agent Endpoint for the Instana backend. | `string` | `"ingress-blue-saas.instana.io"` | no |
| <a name="input_instana_agent_key"></a> [instana\_agent\_key](#input\_instana\_agent\_key) | The Instana Agent Key for authentication with the Instana backend. | `string` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | The security group ID for the ECS service. | `string` | `""` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A list of subnet IDs for the ECS service. | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to provision the ECS service. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_cluster_id"></a> [ecs\_cluster\_id](#output\_ecs\_cluster\_id) | The ID of the ECS Cluster where the Instana Sensor is deployed. |
| <a name="output_ecs_service_name"></a> [ecs\_service\_name](#output\_ecs\_service\_name) | The name of the ECS Service for the Instana Sensor. |
<!-- END_TF_DOCS -->