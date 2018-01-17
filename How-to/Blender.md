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

**Making a video with a transparent background**

*Can't really get this to work properly*

*Can export transparent .png by Setting Alpha to transparent and colours to RGBA
*Convert into format that supports transparency?

* * *

**Change background**

* Go to world tab
* Change "horizon" colour

* * *

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

**Sculpting**

Much of this is based on [this](https://cgi.tutsplus.com/articles/sculpt-model-and-texture-a-low-poly-skull-in-blender--cg-7)

* Import background images to sculpt to: I've found it's easiest to create an empty, change its type to image and load up an image
* Get cube, turn into multires by clicking on modifiers (spanner) and changing to multiresolution - then click subdivide 3 times to make into sphere, followed by apply

**General useful things**

* You can append library information from other .blend files (for example materials) using File -> Append

**Specimen Lighting Tips**

* Use a single wide spotlamp with a distance that falls just short of the specimen and have it quite close
* Play around with blend, samples and soft size to make softer shadows
* Don't underlight it
* Reduce the specular light to get more of an ammonium chloride feel to virtual casts







