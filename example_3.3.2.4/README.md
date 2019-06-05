# Code Structure - Resource and Data Source Arguments - Example 5

Any resource property that requires multiple lines should fall below all properties that can be defined on a single line. Each resource property that requires multiple lines should have blank lines between itself and any other property. These resource properties should be sorted in alphabetical order.

- [good.tf](good.tf) shows a resource with multi-line parameters at the bottom of the resource declaration.
- [bad.tf](bad.tf) shows a resource with multi-line parameters mixed between single-line parameters.
