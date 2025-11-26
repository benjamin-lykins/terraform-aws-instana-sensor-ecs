resource "aws_ecs_task_definition" "instana_sensor" {
  family                   = "instana-sensor"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "2048"
  memory                   = "4096"
  container_definitions = templatefile("${path.module}/templates/container_definition.json.tftpl", {
    instana_agent_key      = var.instana_agent_key
    instana_agent_endpoint = var.instana_agent_endpoint
  })
  execution_role_arn = aws_iam_role.instana.arn
  task_role_arn      = aws_iam_role.instana.arn
}

