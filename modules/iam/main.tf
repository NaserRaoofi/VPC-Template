resource "aws_iam_role" "flow_log_role" {
  count = var.enable_flow_logs ? 1 : 0
  name  = "${var.environment}-vpc-flow-log-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "vpc-flow-logs.amazonaws.com"
        }
      }
    ]
  })

  tags = merge(
    {
      Name        = "${var.environment}-vpc-flow-log-role"
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_iam_role_policy" "flow_log_policy" {
  count = var.enable_flow_logs ? 1 : 0
  name  = "${var.environment}-vpc-flow-log-policy"
  role  = aws_iam_role.flow_log_role[0].id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ]
        Resource = "*"
      }
    ]
  })
}
