# TODO
# * cambiar el nombre de la region por una variable
# * refactorizar los widgets

resource "aws_cloudwatch_dashboard" "poc_dashboard" {
  dashboard_name = "${var.dashboard_name}"

  dashboard_body = templatefile("${path.module}/json/msk-dashboard.json", {
    cluster_name = aws_msk_cluster.poc_cluster.cluster_name
  })
}
