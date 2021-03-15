**Dealing with geometry in blender**

This is about stuff you can do to your models for e.g. reconstructions or 3D printing.

*Manifold geometry*
This is geometry that can exist in the real world, i.e. with:
1. disconnected vertices and faces
2. Internal faces
3. Bits without volume

*Tricks*

* 3D print toolbox (included addon, but activate in Edit>Preferences and find in sidebar of 3D view) is useful for diagnosis (Check all for stats and highlighting).
* Object data properties>Remesh>Voxel*
* Also remesh modifier, slightly diferent settings
* Decimate modifier can reduce face count
* Shrinkwrap can eliminate cracks etc - use with cube with subsurface modifier applied


