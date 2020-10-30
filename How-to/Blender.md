**Hard things in Blender**

* * * 

**Setting up a turntable animation**

From [here](www.blenderguru.com/tutorials/turntable-animation)

* Add an empty
* Parent all objects in model to empty
* Ensure on first frame
* Add a keyframe to the z-rotation (by right-clicking)
* Move to one frame after the last one (to create a seamless loop
* Set rotation to 360 and add another keyframe
* Open the graph editor
* Set interpolation to linear

* * *

**Archives**
* Can make archives to store backups by selecting stuff and pressing m*

**Making a video with a transparent background**

*Can't really get this to work properly*

*Can export transparent .png by Setting Alpha to transparent and colours to RGBA
*Convert into format that supports transparency?

* * *

**Change background**

* Go to world tab
* Change "horizon" colour

* * *

**Viewing**
* Hold Tilde
* X-ray mode (top right) lets you select through

**Making an object (ie. matrix) transparent with something inside**

Put together from various internet forums - may not be the best way of doing it

* Drag across + and set shading to GLSL (from multitexture) - n.b. can't see what this does, but a Youtube Man told me I had to do it so it must be true.
* Tick Transparency and set to Z transparency (alpha level changes transparency.
* Another suggestion was to put them into layers and associate light to allow for different lighting set ups 
* Choose inner object and set to Shadow -> Receive transparent shadows.  This allows light to penetrate the outer object.

* I find the above makes objects cast coloured shadows even when solid, which is really annoying - how to solve?
* * * 

**Doing it with Layers**

* You can put things in separate layers - do this by pressing m.  These layers are represented by a row of boxes at the bottom.
* If you tick the "This layer only" lamp box you can restrict them to specific layers
* This is useful in combination with the transparency above

* * *

**Parenting**
* Parent using Ctrl+P
* Unparent using Alt+P (can keep transform)

* * *

**Materials**

* Make several objects same material - change one, then select all others, Ctrl L and link material

* * *

**Moving stuff**
* Press G to move, can move in one axis only by pressing x, y, or z. Or hold middle mouse and move
* R can be used to rotate, similarly.g

**Creating stuff**
* Modifiers good for changing stuff (spanner)
* Subdivision surface is good for making objects reversibly higher res

**Sculpting**

Much of this is based on [this](https://cgi.tutsplus.com/articles/sculpt-model-and-texture-a-low-poly-skull-in-blender--cg-7)

* Import background images to sculpt to: I've found it's easiest to create an empty, change its type to image and load up an image
* Get cube, turn into multires by clicking on modifiers (spanner) and changing to multiresolution - then click subdivide 3 times to make into sphere, followed by apply
* Duplicate - shift D (esc or rmb snaps back)
* P makes part of something new object
* Alt lmb is select whole edge
* E will extrude, create new nodes below selected
* Press F to change brush size
* If have problems with weird smoothing, can fix with Object Data Properties > Normals > Auto Smooth, Angle dictates cut off - 60 degrees suggested

**General useful things**

* You can append library information from other .blend files (for example materials) using File -> Append

**Specimen Lighting Tips**

* Use a single wide spotlamp with a distance that falls just short of the specimen and have it quite close
* Play around with blend, samples and soft size to make softer shadows
* Don't underlight it
* Reduce the specular light to get more of an ammonium chloride feel to virtual casts
* Can use false colour to look at whether lighting too bright (should be just above grey)*

* Below from [Blender guru](https://www.blenderguru.com/tutorials/mastering-lighting)
* Shadows important to help  visually process geometry
* Think about tonal range - the contrast between levels of lighting in different areas
* "Three-point lighting system". You have a **key light**, the brightest source, at a 45 degree angle from camera, the **fill light**, a lower light at 90 degrees opposite key light, and the **rim light**, a low powered light from the rear. Basic, common system that works reliably well.
* "Implied lighting technique". Off camera object casts a shadow into the scene. Can expand scene.
* "Back lighting". Light from behind causes diffusely lit, soft, intimate scene.
* "Silhouette lighting". Bright lighting from back causes silhouette, can be menacing.
* "Non-key lighting". Using bounce light as main light, rather than key light. Soft, diffuse lighting effect.
* In Cycles (don't know how applies to blender 2.8+) can use meshes to cast light, giving control over shape of lights. Planes are good - like studio lights.
* Size increases brightness, but can also lose sense of lamp's position if set too high
* If you do a render you can generate a histogram of lighting by pressing t. Can draw a sample line.

**Manipulating parts of a mesh**
* If you go into edit mode you can select parts of a mesh by using b, c, and a to do different things.  
* RMB deselects method but keeps selection
* c selects using a paintbrush - scroll to change size
* b selects by using a bounding box
* press z to change to wireframe mode - this will allow you to select through the object, not just the face you can see
* ctrl + + and ctrl + - add and subtract bits respectively - useful for getting rid of isolated bits or growing to take in bits you missed 
* These can then be separated by pressing the p key when you've selected the bit you want to remove
* Combine meshes into a single mess by pressing Ctrl+J
* Press s to change size of object (ctrl will do increments, shift will do slight)
* If tap axis twice after transform operation, it'll do it in the local axis


**Bisecting an object**
This operation will bisect a blender object  - or will it? Haven't tried with a complicated object
* Select object
* Edit mode
* Tools - bisect on left toolbar
* Drag plane
* Press F6 to select things - change plane point and angle
* Object will be bisected!

**Low-poly models**
This link has an interesting workflow: [here](https://blog.sketchfab.com/tutorial-low-poly-assets-from-3d-scans/?utm_source=social&utm_medium=twitter&utm_campaign=blog-post&utm_content=Tutorial:%20Low%20Poly%20Assets%20from%203D%20Scans)


**Texturing**
* **Bump Maps** can make normal maps or black and white. For former use GIMP to turn image greyscale. Then adjust levels to give big contrast of light and dark and export as jpg. Dark bits will be low, light bits high.
* **Reflection (specularity) map** is used to make reflective parts. For this keep on using GIMP to tweak levels to make areas with reflections light and those with none dark.
* **Displacement maps** add in large-scale displacement. Add as a Displacement modifier. Needs lots of polygons, so subdivide surface/ right click and subdivide first


**Material Properties**
* **Fresnel** the idea that at the edges of an object it is more reflective, e.g. in lake reflections more mirrory in distance
* **Roughness** The more rough, the more light is reflected - this impacts fresnel
* **Metals vs dialectrics** Dielectric materials are most materials - some light bounces off and other light is refracted, and they have no coloured reflection. Metals reflect light but absorb all refracted light, so have no diffuseness, and also have a coloured reflection. Metallic slider in principled shader should be at 0 or 1 and changes between the two.
* **Subsurface scattering** Light reflected from within material - a property of organic materials
* **Anisotropy** Gives a stretched reflection like in the back of a frying pan - can change strength and direction. Can add a tangent for direction.
* **Sheen** Sheen is used for fabric. It is not to do with specular reflection - gives a subtle cross-reflection, like velvet. Sheen tint changes from white to base colour.
* **Clearcoat** this is rarely used and adds a sort of lacquer
* **Specular** Changes reflection brightness - most dielectric materials have this at 0.5. To eliminate reflection use roughness.
* **Specular tint** This gives the reflection colour. Not usually needed as dielectric materials have no colour and metallic ones are changed by the metallic shader.
* **Transmission** Allows light through object, and makes glassy. Same as glass shader with the same IOR.
* **IOR** Index of refraction. This only works if transmission is on

**Useful Hotkeys**
* **shift + S** Move position of cursor
* **Ctrl +Alt + Q** Switch into 4 directions mode
* **.** Change point around which translation works
* **Ctrl + B Bevel**
* **gg** to scooch vertices along edges - hold **Alt** to disable clamping and shoot off mesh
* Post gg **e** to match to adjacent vertices, **f** to swap side 
* **Alt + S** shrink along normal
* **Shift + E** Create a crease
* **Shift + Ctrl + Alt + S** Shear (rotate along axes)
* **/** Local view for an object
* **Ctrl + E** Then pick mark seam to mark seam
* **u** uv unwrap in edit mode with all object selectedsz

**Add-ons**
* **Uv squares** To grid by shape in stoolbar fixes uv maps as squares
* **Nodewrangler** Ctrl + shift + left click to test parts of a material

**Colours**
* By default Blender uses sRGB, which is designed for old monitors and is Bad (see [here](https://www.youtube.com/watch?v=m9AT7H4GGrA)). This has a really low dynamic range and the lighting falloff is very abrupt.
* Blenderguru suggests using the Filmic add-on instead. It is pre-installed in more recent editions of blender
* Can mess with settings in Render -> colour management. I can't see all the options though. I will investigate!