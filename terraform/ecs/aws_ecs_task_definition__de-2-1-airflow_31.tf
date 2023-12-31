# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_ecs_task_definition.de-2-1-airflow_9:
resource "aws_ecs_task_definition" "de-2-1-airflow_9" {
    container_definitions    = jsonencode(
        [
            {
                cpu              = 1024
                environment      = []
                environmentFiles = [
                    {
type = "s3"
                        value = "arn:aws:s3:::de-2-1-s3/config/.env"
                    },
                ]
                essential        = true
                healthCheck      = {
                    command     = [
                        "CMD",
                        "redis-cli",
                        "ping",
                    ]
                    interval    = 10
                    retries     = 10
                    startPeriod = 30
                    timeout     = 30
                }
                image            = "docker.io/redis:7.0"
                logConfiguration = {
                    logDriver     = "awslogs"
                    options       = {
                        awslogs-create-group  = "true"
awslogs-group = aws_cloudwatch_log_group._ecs_de-2-1-airflow.name
awslogs-region = data.aws_region.current.name
                        awslogs-stream-prefix = "ecs"
                    }
                    secretOptions = []
                }
                memory           = 2048
                mountPoints      = []
                name             = "redis"
                portMappings     = [
                    {
                        appProtocol   = "http"
                        containerPort = 6379
                        hostPort      = 6379
                        name          = "redis-6379-tcp"
                        protocol      = "tcp"
                    },
                ]
                ulimits          = []
                volumesFrom      = []
            },
            {
                command          = [
                    "webserver",
                ]
                cpu              = 512
                dependsOn        = [
                    {
                        condition     = "HEALTHY"
                        containerName = "redis"
                    },
                ]
                environment      = [
                    {
                        name  = "_AIRFLOW_WWW_USER_CREATE"
                        value = "true"
                    },
                    {
                        name  = "_AIRFLOW_WWW_USER_PASSWORD"
                        value = "airflow"
                    },
                    {
                        name  = "_AIRFLOW_WWW_USER_USERNAME"
                        value = "airflow"
                    },
                ]
                environmentFiles = [
                    {
type = "s3"
                        value = "arn:aws:s3:::de-2-1-s3/config/.env"
                    },
                ]
                essential        = true
                healthCheck      = {
                    command     = [
                        "CMD-SHELL",
                        "[ -f /usr/local/airflow/airflow-webserver.pid ]",
                    ]
                    interval    = 30
                    retries     = 3
                    startPeriod = 0
                    timeout     = 30
                }
                image            = "862327261051.dkr.ecr.us-west-2.amazonaws.com/de-2-1-airflow:latest"
                logConfiguration = {
                    logDriver     = "awslogs"
                    options       = {
                        awslogs-create-group  = "true"
awslogs-group = aws_cloudwatch_log_group._ecs_de-2-1-airflow.name
awslogs-region = data.aws_region.current.name
                        awslogs-stream-prefix = "ecs"
                    }
                    secretOptions = []
                }
                memory           = 1024
                mountPoints      = []
                name             = "webserver"
                portMappings     = [
                    {
                        appProtocol   = "http"
                        containerPort = 8080
                        hostPort      = 8080
                        name          = "webserver-8080-tcp"
                        protocol      = "tcp"
                    },
                ]
                volumesFrom      = []
            },
            {
                command          = [
                    "scheduler",
                ]
                cpu              = 512
                dependsOn        = [
                    {
                        condition     = "HEALTHY"
                        containerName = "redis"
                    },
                ]
                environment      = []
                environmentFiles = [
                    {
type = "s3"
                        value = "arn:aws:s3:::de-2-1-s3/config/.env"
                    },
                ]
                essential        = true
                healthCheck      = {
                    command     = [
                        "CMD",
                        "curl",
                        "--fail",
                        "http://localhost:8974/health",
                    ]
                    interval    = 30
                    retries     = 5
                    startPeriod = 0
                    timeout     = 10
                }
                image            = "862327261051.dkr.ecr.us-west-2.amazonaws.com/de-2-1-airflow:latest"
                logConfiguration = {
                    logDriver     = "awslogs"
                    options       = {
                        awslogs-create-group  = "true"
awslogs-group = aws_cloudwatch_log_group._ecs_de-2-1-airflow.name
awslogs-region = data.aws_region.current.name
                        awslogs-stream-prefix = "ecs"
                    }
                    secretOptions = []
                }
                memory           = 2048
                mountPoints      = []
                name             = "scheduler"
                portMappings     = []
                volumesFrom      = []
            },
            {
                command          = [
                    "worker",
                ]
                cpu              = 1024
                dependsOn        = [
                    {
                        condition     = "HEALTHY"
                        containerName = "redis"
                    },
                ]
                environment      = []
                environmentFiles = [
                    {
type = "s3"
                        value = "arn:aws:s3:::de-2-1-s3/config/.env"
                    },
                ]
                essential        = true
                healthCheck      = {
                    command     = [
                        "CMD-SHELL",
                        "celery --app airflow.executors.celery_executor.app inspect ping -d "celery@$${HOSTNAME}"",
                    ]
                    interval    = 30
                    retries     = 5
                    startPeriod = 0
                    timeout     = 10
                }
                image            = "862327261051.dkr.ecr.us-west-2.amazonaws.com/de-2-1-airflow:latest"
                logConfiguration = {
                    logDriver     = "awslogs"
                    options       = {
                        awslogs-create-group  = "true"
awslogs-group = aws_cloudwatch_log_group._ecs_de-2-1-airflow.name
awslogs-region = data.aws_region.current.name
                        awslogs-stream-prefix = "ecs"
                    }
                    secretOptions = []
                }
                memory           = 3072
                mountPoints      = []
                name             = "worker"
                portMappings     = []
                ulimits          = []
                volumesFrom      = []
            },
        ]
    )
    cpu                      = "4096"
execution_role_arn = aws_iam_role.r-DE-2-1-ecsTaskExecutionRole.arn
    family                   = "de-2-1-airflow"
    memory                   = "8192"
    network_mode             = "awsvpc"
    requires_compatibilities = [
        "FARGATE",
    ]
    tags                     = {
        "Team" = "DE-2-1"
    }
    tags_all                 = {
        "Team" = "DE-2-1"
    }
task_role_arn = aws_iam_role.r-DE-2-1-ecsTaskExecutionRole.arn

    runtime_platform {
        cpu_architecture        = "X86_64"
        operating_system_family = "LINUX"
    }
}
