# LuxuryBrands_Infra
terraform 및 서비스 별 설정 파일 저장소

## Infrastructure Diagram
![diagram.png](diagram.png)

| Lambda | 데이터 수집 프로세스 실행 및 스케줄링 |
| --- | --- |
| SecretManger | 토큰, Connection 등 민감 정보 관리 |
| CloudWatch | AWS 서비스 상태 모니터링 |
| S3 | 환경변수 및 EMR 저장소, 데이터 레이크 |
| Redshift | Raw Data , Mart Data가 적재된 데이터 웨어하우스<br/> * dc2.large, 2노드 |
| EMR | ETL, ELT 작업을 처리하는 클러스터<br/> * m4.large Spot, 최소 노드 2 (Primary, Core) |
| ECR | Docker 이미지 저장소 |
| ECS | Airflow 컨테이너를 관리하는 Serverless 오케스트레이션<br/> * fargate Spot, 4개 컨테이너 |
| RDS | Airflow 서비스의 메타 데이터 저장소 |

## Project Structure

```
.
├── README.md
├── diagram.png
├── dw
│    └── Redshift_Schema.sql
├── emr
│    ├── emr_bootstrap.sh
│    └── emr_configurations.json
└── terraform
    ├── ecs
    ├── emr
    ├── lambda
    ├── network
    └── secretmanager
```
