# Layer/Module Title

An example of a Terraform layer.

## Default Resources

Call out any default settings

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_account\_id | AWS Account ID being worked in | string | n/a | yes |
| environment | Name of the environment such as Production, Staging, etc. | string | n/a | yes |
| layer | Name of the layer to propagate to resources. | string | n/a | yes |
| region | The region in which to build resources. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| sg\_alb\_id | ID of the ALB security group. |

