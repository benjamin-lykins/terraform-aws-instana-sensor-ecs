resource "aws_ecs_cluster" "instana_sensor" {
  count = var.create_ecs_cluster ? 1 : 0
  name  = "instana-sensor-cluster"
}

data "aws_ecs_cluster" "instana_sensor" {
  count        = var.create_ecs_cluster ? 0 : 1
  cluster_name = var.ecs_cluster
}

data "aws_security_group" "instana_sensor" {
  count = var.create_security_group ? 0 : 1
  id    = var.security_group_id
}

resource "aws_security_group" "instana_sensor" {
  count       = var.create_security_group ? 1 : 0
  name        = "instana-sensor-sg"
  description = "Security group for Instana Sensor ECS Task"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ecs_service" "instana_sensor" {
  name            = "instana-sensor-service"
  task_definition = aws_ecs_task_definition.instana_sensor.arn
  cluster         = var.create_ecs_cluster ? one(aws_ecs_cluster.instana_sensor.*.id) : one(data.aws_ecs_cluster.instana_sensor.*.id)
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = var.subnets
    security_groups  = var.create_security_group ? [one(aws_security_group.instana_sensor.*.id)] : [one(data.aws_security_group.instana_sensor.*.id)]
    assign_public_ip = false
  }
}
