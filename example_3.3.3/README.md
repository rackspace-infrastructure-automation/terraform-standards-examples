# Code Structure - Example Terraform Files

When present, depends_on and lifecycle should be the last two resource properties defined respectively. Each should be separated by a single blank line.

- [main.tf](abc_example/main.tf) - call modules, locals and data-sources to create all resources
- [variables.tf](abc_example/variables.tf) - contains declarations of variables used in main.tf

- [outputs.tf](abc_example/outputs.tf) - contains outputs from the resources and modules created in main.tf

- [terraform.tfvars](abc_example/terraform.tfvars) - should only be used in layers.

- [README.md](abc_example/README.md) - description of layer or module, including variables and outputs
