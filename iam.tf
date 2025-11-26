data "aws_iam_policy_document" "instana_sensor_assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "instana" {
  name_prefix        = "instana-sensor-"
  assume_role_policy = data.aws_iam_policy_document.instana_sensor_assume_role_policy.json
}

resource "aws_iam_policy" "instana_sensor_policy" {
  name_prefix = "instana-sensor-"
  description = "Policy for Instana Sensor ECS Task Execution Role"
  policy      = file("${path.module}/templates/IAMpermissions.json.tftpl")
}

resource "aws_iam_role_policy_attachment" "instana_sensor_role_attachment" {
  role       = aws_iam_role.instana.name
  policy_arn = aws_iam_policy.instana_sensor_policy.arn
}
