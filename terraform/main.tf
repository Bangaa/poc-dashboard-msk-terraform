# VPC

data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_vpc" "myVPC" {
  cidr_block = "10.32.0.0/16"

  tags = {
    Name = "my-VPC"
  }
}

resource "aws_subnet" "subnet_az1" {
  availability_zone = data.aws_availability_zones.azs.names[0]
  vpc_id            = aws_vpc.myVPC.id
  cidr_block        = "10.32.1.0/24"

  tags = {
    Name = "Private subnet 1A"
  }
}

resource "aws_subnet" "subnet_az2" {
  availability_zone = data.aws_availability_zones.azs.names[1]
  vpc_id            = aws_vpc.myVPC.id
  cidr_block        = "10.32.2.0/24"

  tags = {
    Name = "Private subnet 2A"
  }
}

# SG

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.myVPC.id
}

# Cloudwatch Log group
resource "aws_cloudwatch_log_group" "msk_brokers" {
  name = "msk_broker_logs"
}

# MSK

resource "aws_msk_cluster" "poc_cluster" {
  # required
  broker_node_group_info {
    # required
    client_subnets  = [aws_subnet.subnet_az1.id, aws_subnet.subnet_az2.id]
    instance_type   = "kafka.t3.small"
    security_groups = [aws_security_group.sg.id]
  }
  cluster_name           = "${var.cluster_name}"
  kafka_version          = "2.8.1"
  number_of_broker_nodes = 2

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = true
        log_group = aws_cloudwatch_log_group.msk_brokers.name
      }
    }
  }
}
