# Code Structure - Resource and Data Source Arguments - Example 3

If the count property is used on a resource, it should be the first argument, directly after the resource declaration.  A blank line should separate the count property from other resource properties.

- [good.tf](good.tf) shows the desired use of the count property.
- [bad.tf](bad.tf) shows the undesired use of count mixed with other resource properties.
