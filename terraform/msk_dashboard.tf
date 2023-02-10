# TODO
# * cambiar el nombre de la region por una variable
# * refactorizar los widgets

/*
resource "aws_cloudwatch_dashboard" "poc_dashboard" {
  dashboard_name = "${var.dashboard_name}"

  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 8,
      "properties": {
        "metrics": [
            [ { "expression": "SELECT AVG(CpuUser) FROM \"AWS/Kafka\" WHERE \"Cluster Name\" = '${aws_msk_cluster.poc_cluster.cluster_name}' GROUP BY \"Broker ID\"", "label": "Broker", "id": "cpu_user", "region": "us-east-1" } ]
        ],
        "view": "timeSeries",
        "stacked": false,
        "region": "us-east-1",
        "stat": "Average",
        "period": 300,
        "title": "CPU Utilization per Broker",
        "yAxis": {
          "left": {
            "label": "Percent"
          }
        }
      }
    },
    {
      "type": "metric",
      "width": 6,
      "height": 4,
      "properties": {
        "metrics": [
          [ "AWS/Kafka", "GlobalPartitionCount", "Cluster Name", "${aws_msk_cluster.poc_cluster.cluster_name}" ]
        ],
        "sparkline": false,
        "view": "singleValue",
        "region": "us-east-1",
        "title": "Number of partition across all brokers",
        "period": 300,
        "stat": "SampleCount",
        "liveData": false,
        "singleValueFullPrecision": false
      }
    },
    {
      "type": "metric",
      "width": 6,
      "height": 4,
      "properties": {
        "metrics": [
          [ "AWS/Kafka", "GlobalTopicCount", "Cluster Name", "${aws_msk_cluster.poc_cluster.cluster_name}" ]
        ],
        "sparkline": false,
        "view": "singleValue",
        "region": "us-east-1",
        "title": "Number of topics across all brokers",
        "period": 300,
        "stat": "SampleCount"
      }
    },
    {
      "type": "metric",
      "width": 6,
      "height": 4,
      "properties": {
        "sparkline": false,
        "view": "singleValue",
        "metrics": [
          [ "AWS/Kafka", "OfflinePartitionsCount", "Cluster Name", "${aws_msk_cluster.poc_cluster.cluster_name}" ]
        ],
        "region": "us-east-1",
        "title": "Number of partitions that are offline",
        "liveData": true,
        "period": 300
      }
    },
    {
      "type": "metric",
      "width": 6,
      "height": 4,
      "properties": {
        "metrics": [
          [ { "expression": "SELECT SUM(UnderMinIsrPartitionCount) FROM \"AWS/Kafka\" WHERE \"Cluster Name\" = '${aws_msk_cluster.poc_cluster.cluster_name}'", "label": "Total across brokers", "id": "q1", "region": "us-east-1" } ]
        ],
        "sparkline": true,
        "view": "singleValue",
        "region": "us-east-1",
        "stat": "Average",
        "period": 300,
        "title": "Out of Sync Replicas"
      }
    },
    {
      "type": "metric",
      "width": 12,
      "height": 8,
      "properties": {
        "metrics": [
          [ { "expression": "SELECT AVG(RootDiskUsed) FROM \"AWS/Kafka\" WHERE \"Cluster Name\" = '${aws_msk_cluster.poc_cluster.cluster_name}' GROUP BY \"Broker ID\"", "label": "Broker", "id": "root_disk_used", "region": "us-east-1", "stat": "Average" } ]
        ],
        "view": "timeSeries",
        "stacked": false,
        "region": "us-east-1",
        "stat": "Average",
        "period": 300,
        "yAxis": {
          "left": {
            "label": "Percent",
            "showUnits": false
          }
        },
        "title": "Disk Usage by Broker"
      }
    },
    {
      "type": "metric",
      "width": 12,
      "height": 8,
      "properties": {
        "metrics": [
          [ { "expression": "SELECT AVG(MessagesInPerSec) FROM \"AWS/Kafka\" WHERE \"Cluster Name\" = '${aws_msk_cluster.poc_cluster.cluster_name}' GROUP BY \"Broker ID\"", "label": "Broker", "id": "q1", "region": "us-east-1" } ]
        ],
        "view": "timeSeries",
        "stacked": false,
        "region": "us-east-1",
        "stat": "Average",
        "period": 300,
        "yAxis": {
          "left": {
            "label": "Count/Sec",
            "showUnits": false
          }
        },
        "title": "Incoming Messages by Broker"
      }
    },
    {
      "type": "metric",
      "width": 6,
      "height": 4,
      "properties": {
        "metrics": [
          [ { "expression": "SELECT SUM(UnderReplicatedPartitions) FROM \"AWS/Kafka\" WHERE \"Cluster Name\" = '${aws_msk_cluster.poc_cluster.cluster_name}'", "label": "Total", "id": "q1", "region": "us-east-1" } ]
        ],
        "sparkline": true,
        "view": "singleValue",
        "region": "us-east-1",
        "stat": "Average",
        "period": 300,
        "title": "Replicas Offline"
      }
    }
  ]
}
EOF
}
*/
