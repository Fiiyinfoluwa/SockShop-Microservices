data "aws_eks_cluster" "eks-cluster" {
  name = var.cluster_name

  depends_on = [
    aws_eks_cluster.eks_cluster
  ]
}

data "aws_eks_cluster_auth" "cluster-auth" {
  depends_on = [aws_eks_cluster.eks_cluster]
  name       = aws_eks_cluster.eks_cluster.name
}

data "kubernetes_service" "nginx-service"{
  metadata {
    name = "nginx-ingress-controller"
  }

  depends_on = [
    helm_release.nginx-ingress-controller
  ]
}

data "kubectl_file_documents" "prometheus-ingress" {
    content = file("prometheus-ingress.yaml")
}

data "kubectl_file_documents" "portfolio" {
    content = file("portfolio.yaml")    
}

data "kubectl_file_documents" "portfolio-ingress" {
    content = file("portfolio-ingress.yaml")
}

data "kubectl_file_documents" "sockshop" {
    content = file("microservices.yaml")    
}

data "kubectl_file_documents" "sockshop-ingress" {
    content = file("sockshop-ingress.yaml")
}

data "kubectl_file_documents" "loki-ingress" {
    content = file("loki-ingress.yaml")
}

