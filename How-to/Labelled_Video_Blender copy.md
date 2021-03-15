**Animating with armatures in Blender**

A bit of a stream of consciousness whizz through animating with armatures/bones in Blender, as used to make hinges etc in animation.

1. Create armature with series of bones corresponding to segments
2. Add any movement constraints as bone constraints (e.g. constrain motion to x axis)
3. And an inverse kinematics bone constraint to the armature, targeting whatever you want to be moving the array.
4. If you want meshes to follow the bones, you can add an object "Child of" constraint targeting the Armature and then choose a bone. Might have to set inverse
5. Stiffen joints in pose mode -> Bone Properties -> Inverse kinematics, where you can set stiffness around axes

#![Objects](https://github.com/rpdearden/Miscellany/blob/master/How-to/Images/Labels1.png "Labels1")
