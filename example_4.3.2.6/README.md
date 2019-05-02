# Code Structure - Resource and Data Source Arguments - Example 6

When present, depends_on and lifecycle should be the last two resource properties defined respectively. Each should be separated by a single blank line.

- [good.tf](good.tf) shows a resource with depends_on and lifecycle properties as the final properties in the resource declaration.
- [bad.tf](bad.tf) shows a resource with the depends_on and lifecycle properties intermixed with other resource properties.
