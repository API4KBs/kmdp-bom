# kmdp-bom
##Release Instructions

Affected variables:
* project.version (SELF)
* properties
  * api4kp.version
  * kmdp.impl.version
  * kmdp.standards.version
  * kmdp.archetype.version

### Release Branch
1. Set all affected variables to a known version V
2. Run 
"maven validate -Prelease" 
to enforce validation rules

### Nex Dev Branch
1. Set project.version to the next minor version: V + 0.0.1
2. Set properties to a suitable range where appropriate, e.g. (V,V + 0.1.0) 