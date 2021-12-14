resource "aws_iam_role" "bitcoin_ecs_task_execution" {
  name                 = "bitcoin_ecs_task_execution"
  assume_role_policy   = data.aws_iam_policy_document.bitcoin_ecs_task_execution.json
  max_session_duration = 3600
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy_attach" {
  role       = aws_iam_role.bitcoin_ecs_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "bitcoin_ecs_task_execution" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
    ]
  }

}