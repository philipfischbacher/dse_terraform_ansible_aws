#
# Security group rules:
# - open opscenter-agent ports
#
resource "aws_security_group" "sg_internal" {
  name   = "sg_internal"
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.tag_identifier}-sg_internal"
    Environment = var.env
  }
}


# 
# Security group rules:
# - open SSH port (22) from anywhere
#
resource "aws_security_group" "sg_ssh" {
  name   = "sg_ssh"
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.tag_identifier}-sg_ssh"
    Environment = var.env
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 
# Security group rules: 
# - open Grafana HTTP access from anywhere
#
resource "aws_security_group" "sg_grafana_web" {
  name   = "sg_grafana_web"
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.tag_identifier}-sg_grafana_web"
    Environment = var.env
  }

  # Grafana web
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 
# Security group rules: 
# - open OpsCenter HTTPS access from anywhere
#   (assuming OpsCenter web access is enabled)
#
resource "aws_security_group" "sg_opsc_web" {
  name   = "sg_opsc_web"
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.tag_identifier}-sg_opsc_web"
    Environment = var.env
  }

  # OpsCenter server HTTPS port
  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # OpsCenter server HTTP port
  ingress {
    from_port   = 8888
    to_port     = 8888
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#
# Security group rules:
# - Ports required for proper OpsCenter/Datastax-agent function
#
resource "aws_security_group" "sg_opsc_node" {
  name   = "sg_opsc_node"
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.tag_identifier}-sg_opsc_node"
    Environment = var.env
  }

  # Outbound: allow everything to everywhere
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # OpsCenter Definitions port
  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # LCM proxy port
  ingress {
    from_port       = 3128
    to_port         = 3128
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # Stomp ports: agent -> opsc
  ingress {
    from_port       = 61619
    to_port         = 61620
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }
}

#
# Security group rules:
# - Ports required for proper DSE function
#
resource "aws_security_group" "sg_dse_node" {
  name   = "sg_dse_node"
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.tag_identifier}-sg_dse_node"
    Environment = var.env
  }

  # Outbound: allow everything to everywhere
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # DSEFS inter-node communication port
  ingress {
    from_port       = 5599
    to_port         = 5599
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # DSE inter-node cluster communication port
  # - 7000: No SSL
  # - 7001: With SSL
  ingress {
    from_port       = 7000
    to_port         = 7001
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # Spark master inter-node communication port
  ingress {
    from_port       = 7077
    to_port         = 7077
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # JMX monitoring port
  ingress {
    from_port       = 7199
    to_port         = 7199
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # Port for inter-node messaging service
  ingress {
    from_port       = 8609
    to_port         = 8609
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # DSE Search web access port
  ingress {
    from_port       = 8983
    to_port         = 8983
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # Native transport port
  ingress {
    from_port       = 9042
    to_port         = 9042
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # Prometheus scraping port
  ingress {
    from_port       = 9103
    to_port         = 9103
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # Native transport port, with SSL
  ingress {
    from_port       = 9142
    to_port         = 9142
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # Spark SQL Thrift server port
  ingress {
    from_port       = 10000
    to_port         = 10000
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }

  # http port: opsc -> agent
  ingress {
    from_port       = 61621
    to_port         = 61621
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal.id]
  }
}
