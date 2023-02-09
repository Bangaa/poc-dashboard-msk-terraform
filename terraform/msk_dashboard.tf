resource "aws_cloudwatch_dashboard" "poc_dashboard" {
  dashboard_name = "${var.dashboard_name}"

  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 5,
      "height": 5,
      "properties": {
        "sparkline": true,
        "metrics": [
          [
            "AWS/Kafka",
            "GlobalTopicCount",
            "Cluster Name",
            "${aws_msk_cluster.poc_cluster.cluster_name}"
          ]
        ],
        "view": "singleValue",
        "region": "us-east-1",
        "period": 300,
        "title": "Número de tópicos"
      }
    }
  ]
}
EOF
}
