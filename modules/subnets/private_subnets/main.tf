resource "aws_subnet" "private" {
  count             = length(var.azs) * 2
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr, 6, count.index + 10)
  availability_zone = var.azs[floor(count.index / 2)]

  tags = merge(var.tags, {
    Name = "${var.environment}-private-${count.index + 1}"
  })
}
