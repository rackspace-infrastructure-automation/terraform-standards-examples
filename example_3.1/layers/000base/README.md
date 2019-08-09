# 000base

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| app\_name | The name of the application, e.g. Magento, Wordpress, CustomerName, etc. | string | n/a | yes |
| aws\_account\_id | The account ID you are building into. | string | n/a | yes |
| cidr\_range | VPC CIDR range. | string | n/a | yes |
| environment | The name of the environment, e.g. Production, Development, etc. | string | n/a | yes |
| private\_cidr\_ranges | List of private CIDRs to be used. | list | n/a | yes |
| public\_cidr\_ranges | List of public CIDRs to be used. | list | n/a | yes |
| region | The AWS region the state should reside in. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| nat\_gateway\_eip | The NAT gateway EIP(s) of the Base Network. |
| private\_route\_tables | The private route tables of the Base Network. |
| private\_subnets | The private subnets of the Base Network. |
| public\_route\_tables | The public route tables of the Base Network. |
| public\_subnets | The public subnets of the Base Network. |
| r53\_internal\_name | Hosted Zone Name |
| r53\_internal\_zone | Internal Route53 Zone ID. |
| sns\_topic\_arn | The ARN of the SNS topic. |
| sns\_topic\_id | The ID of the SNS topic. |
| ssm\_service\_roles | All details about created SSM Service Roles. |
| state\_import\_example | An example to use this layers state in another. |
| vpc\_id | The VPC ID of the Base Network. |
