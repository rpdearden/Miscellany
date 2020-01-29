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
