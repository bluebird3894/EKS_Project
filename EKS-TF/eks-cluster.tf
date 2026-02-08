# Modified Reddit-Project/EKS-TF/eks-cluster.tf
resource "aws_eks_cluster" "eks-cluster" {
  name     = var.cluster-name # Changed from var.eks_cluster_name to match variables.tf
  role_arn = aws_iam_role.EKSClusterRole.arn
  version  = "1.30"

  vpc_config {
    subnet_ids         = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
    security_group_ids = [aws_security_group.eks_sg.id]
  }
}