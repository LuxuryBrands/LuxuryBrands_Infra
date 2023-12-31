# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_instance.i-00bb15799d18480de:
resource "aws_instance" "i-00bb15799d18480de" {
  ami                                  = "ami-04e35eeae7a7c5883"
  associate_public_ip_address          = true
  availability_zone                    = "us-west-2a"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  get_password_data                    = false
  hibernation                          = false
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  key_name                             = "DE-2-1-key"
  monitoring                           = false
  placement_partition_number           = 0
  secondary_private_ips                = []
  security_groups                      = []
  source_dest_check                    = true
  subnet_id                            = aws_subnet.subnet-0eaeed36de733a9ff.id
  tags = {
    "Name" = "DE_2_1_bastion"
    "Team" = "DE-2-1"
  }
  tags_all = {
    "Name" = "DE_2_1_bastion"
    "Team" = "DE-2-1"
  }
  tenancy = "default"
  vpc_security_group_ids = [
    aws_security_group.sg-0ae136d33533aae3d.id,
    aws_security_group.sg-0c5dc574de179c7a2.id,
  ]

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = 1
    threads_per_core = 1
  }

  credit_specification {
    cpu_credits = "standard"
  }

  enclave_options {
    enabled = false
  }

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
  user_data_replace_on_change = false
}
