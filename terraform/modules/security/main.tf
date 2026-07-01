resource "aws_security_group" "public_web" {
  name        = "${var.project_name}-${var.environment}-public-web"
  description = "Allows HTTP and HTTPS traffic to the future public entry point."
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "application" {
  name        = "${var.project_name}-${var.environment}-application"
  description = "Allows application workload traffic inside the platform network."
  vpc_id      = var.vpc_id

  ingress {
    description     = "Frontend HTTP from public entry point"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.public_web.id]
  }

  ingress {
    description     = "Backend API from public entry point"
    from_port       = 8000
    to_port         = 8000
    protocol        = "tcp"
    security_groups = [aws_security_group.public_web.id]
  }

  egress {
    description = "Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "database" {
  name        = "${var.project_name}-${var.environment}-database"
  description = "Restricts database access to application workloads."
  vpc_id      = var.vpc_id

  ingress {
    description     = "PostgreSQL from application workloads"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.application.id]
  }

  egress {
    description = "Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
