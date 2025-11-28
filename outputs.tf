output "ecs_cluster_id" {
  description = "The ID of the ECS Cluster where the Instana Sensor is deployed."
  value       = var.create_ecs_cluster ? one(aws_ecs_cluster.instana_sensor.*.id) : one(data.aws_ecs_cluster.instana_sensor.*.id)
}

output "ecs_service_name" {
  description = "The name of the ECS Service for the Instana Sensor."
  value       = aws_ecs_service.instana_sensor.name
}
