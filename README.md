# LuxuryBrands_Infra
terraform 및 서비스 별 설정 파일 저장소

## AWS Infrastructure diagram
![diagram.png](diagram.png)

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
