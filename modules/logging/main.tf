resource "aws_cloudwatch_log_group" "flow_log_group" {
  count             = var.enable_flow_logs ? 1 : 0
  name              = "/aws/vpc/${var.environment}-vpc-flow-logs"
  retention_in_days = var.flow_logs_retention_days

  tags = merge(
    {
      Name        = "${var.environment}-vpc-flow-logs"
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_flow_log" "vpc_flow_log" {
  count                    = var.enable_flow_logs ? 1 : 0
  iam_role_arn             = var.log_role_arn
  log_destination          = aws_cloudwatch_log_group.flow_log_group[0].arn
  traffic_type             = "ALL"
  vpc_id                   = var.vpc_id
  max_aggregation_interval = 60

  tags = merge(
    {
      Name        = "${var.environment}-vpc-flow-logs"
      Environment = var.environment
    },
    var.tags
  )
}
