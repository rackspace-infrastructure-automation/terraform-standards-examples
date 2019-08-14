# _main_

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_account\_id | The account ID you are building into. | string | n/a | yes |
| region | The AWS region the state should reside in. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| remote\_state\_configuration\_example | A suggested terraform block to put into the build layers |
| state\_bucket\_id | The ID of the bucket to be used for state files. |
| state\_bucket\_region | The region the state bucket resides in. |
| state\_import\_example | An example to use this layers state in another. |
