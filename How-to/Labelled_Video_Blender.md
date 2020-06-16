**Making a video where labels follow the model**

This is based around a video where you have a 3D model that you would like to add labels to, but due to movement the labels will track the model.

It assumes you have a 3D object (or objects) parented to an empty with an animated translation.

It will create labels with text, and a line pointing to your desired feature. The ends of the line are referred to as the text end (towards text) and the pointy end (pointing at feature).

Think carefully about where labels are and rotation to avoid crossovers.

1. Make an extended mesh for your label lines (I extrude a sphere so it has rounded ends, but whatever you fancy). This linemesh be duplicated for future lines so keep it somewhere (easier to change size along original axis and if has no modifiers). Give it a shader of your choice (white emission shader will give you a clear white line).

![Objects](https://github.com/rpdearden/Miscellany/blob/master/How-to/Images/Labels1.png "Labels1")

2. Move this linemesh into position and place an empty at both text and pointy ends (using cursor with shift+s is easiest)

![Objects](https://github.com/rpdearden/Miscellany/blob/master/How-to/Images/Labels2.png "Labels2")

3. Create an armature with an origin at the empty at the text end. Set other end of the armature to the location of the pointy end.

![Objects](https://github.com/rpdearden/Miscellany/blob/master/How-to/Images/Labels3.png "Labels3")

4. Go to pose mode and create a "stretchto" bone constraint targeting the empty at the pointy end.

![Objects](https://github.com/rpdearden/Miscellany/blob/master/How-to/Images/Labels4.png "Labels4")

5. Parent the linemesh to the armature (ctrlP+  automatic deformation). Tick Preserve volume in the constraints tab

![Objects](https://github.com/rpdearden/Miscellany/blob/master/How-to/Images/Labels5.png "Labels5")

6. Parent the empty at the pointy end to the translating empty that your central model is parented to.

![Objects](https://github.com/rpdearden/Miscellany/blob/master/How-to/Images/Labels6.png "Labels6")

7. Make some text for your label and give the same shader as your linemeshes 

![Objects](https://github.com/rpdearden/Miscellany/blob/master/How-to/Images/Labels7.png "Labels7")

8. Put all your label components into a collection so you don't get confused.

![Objects](https://github.com/rpdearden/Miscellany/blob/master/How-to/Images/Labels8.png "Labels8")

9. Underwhelm your family and friends with your amazing new labelled video (click image to link to video)

[![Alternate Text](https://github.com/rpdearden/Miscellany/blob/master/How-to/Images/Labels9.png)](https://drive.google.com/file/d/18Tdz8o-OAqKJvWRItVw-SrmIBbEqmK82/view?usp=sharing "Labelled Monkey vid")
