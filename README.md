# terraform-module-aws-eventbridge-scheduler

## Terraform Module: AWS EventBridge Scheduler

[![Terraform Version](https://img.shields.io/badge/Terraform-1.4.5-blue.svg)](https://www.terraform.io)

This Terraform module provides a convenient way to create AWS EventBridge Scheduler. It abstracts the complexity of creating and managing EventBridge resources, allowing you to easily define and scheduled rules within your infrastructure.

## Usage

The module can be used by including it as a source in your existing Terraform configuration:

```hcl
module "eventbridge_scheduler" {
  source      = "github.com/jfjp/terraform-module-aws-eventbridge-scheduler"

  schedule_name        = "start-web-service"
  schedule_description = "Start Web service"
  schedule_state       = "ENABLED"
  schedule_expression  = "cron(0 8 * * ? *)"
  schedule_target_arn  = "arn:aws:scheduler:::aws-sdk:ecs:updateService"
  schedule_target_input = jsonencode({
    Service      = "web-service"
    Cluster      = "WebAppCluster"
    DesiredCount = 1
  })
  schedule_task_role_name = "StartAndStopECSServiceTask"
}
```

Replace `schedule_name`, `schedule_description`, `schedule_expression`, etc with your desired values. You can also customize the module further by including additional optional parameters.

To deploy an example configuration run:

```shell
terraform init
terraform apply
```

For more details about inputs of this module, please refer to the [variables.tf](https://github.com/jfjp/terraform-module-aws-eventbridge-scheduler/blob/main/modules/event-bridge-scheduler/variables.tf).

## License

This module is licensed under the MIT License. See the [LICENSE](https://github.com/jfjp/terraform-module-aws-eventbridge-scheduler/blob/master/LICENSE) file for more details.

## Authors

This module is maintained by JUNPEI Fujita.

## License

See [LICENSE](https://github.com/jfjp/terraform-module-aws-eventbridge-scheduler/blob/main/LICENSE) for full details.

## Disclaimer

This module is provided as-is and is not officially supported by [AWS](https://aws.amazon.com/),[HashiCorp](https://www.hashicorp.com), or the [Terraform AWS modules](https://github.com/terraform-aws-modules).