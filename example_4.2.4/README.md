# Code Structure - Terraform Module Standards - Example 4

Modules should be built using a minimum of the standard files: main.tf, variables.tf, outputs.tf

For complicated environments, the main.tf fille may become difficult to parse. For these situations, an additional file can be created to define some of the resources. The file should be descriptively named to denote the purpose or resource type it contains. Examples include "webstack.tf" or "iam.tf". Resources moved to this file should all be related to the described purpose or type., other resources should still be defined in main.tf. You should only create separate files if either the defined resource count exceeds 20 or the line count exceeds 500.

- [good](good) shows terraform files broken out by resource type.
- [bad](bad) shows terraform files broken out arbitrarily.
