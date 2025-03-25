resource "aws_subnet" "public" {
  count                   = length(var.azs)
  vpc_id                  = var.vpc_id
  cidr_block              = cidrsubnet(var.vpc_cidr, 6, count.index)
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name = "${var.environment}-public-${var.azs[count.index]}"
  })
}
