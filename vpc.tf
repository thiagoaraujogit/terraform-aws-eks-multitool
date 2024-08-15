resource "aws_security_group" "cluster" {
  name        = "${local.name}-eks-cluster-sg"
  description = "Allow traffic between EKS control plane and it's nodes."

  vpc_id = var.vpc_id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    { Name = "${local.name}-eks-cluster-sg" },
    local.common_tags
  )
}