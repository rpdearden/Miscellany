**Making images of 3D palaeontological figures in Blender**
This is an introduction to using Blender for making images of 3D models which can be used for scientific figures.
It is aimed at someone with no experience of Blender, and so will take a fairly direct path to doing the above, ignoring many Blender mysteries along the way.
Hopefully by the end though you'll be able to go off and take images of any 3D models you desire, palaeontological or otherwise, and will have enough of a basic understanding to start looking into more complex things.
This was originally written for a workshop based around taking images of *Protoichthyosaurus* at the University of Birmingham, using Blender 3.3 in 2022.

****
**What is Blender and why use it?**
Blender is a free, open source software for 3D computer graphics ([website](https://www.blender.org/)).
In this tutorial we will be using it to set up a very simple "virtual studio" to image 3D models of fossils.
However Blender can do almost anything you'd want to do with 3D data - sculpting, modelling, rigging, animations, video editing, compositing...
It is open source and community led, so new features are added every update, although these can vary depending on what the community is interested in.
It is of a professional standard, there are loads of cool animated films made in it.
Because it is free it is also very widely used by amateurs and there are loads of videos and guides on the internet.
Blender gives you far more control over making images of 3D models than the built in 3D viewers in (for example) Mimics.
This means you can produce images which are not only more beautiful, but which are also better at illustrating anatomy.
Blender is quite heavily hotkey based, so I'll introduce some of the common ones, but most things you can do with hotkeys you can also do with menus, GUI buttons etc.

****

**What are we going to do with Blender today?**
This workshop will cover basic controls, importing your models, scene setup, lighting, materials, and rendering.
By the end of it you should be able to import a 3D model with a texture, and make beautiful pictures of it to put into your Nature paper.
At the end I'll try and give you an overview of what else you can do in Blender, and if there's an appetite for it I can do a future workshop on animating stuff.


**Installing Blender**
You will find Blender to download [here](https://www.blender.org/download/).
At the time of writing the most recent version is version 3.3.1.
It works on Windows, Mac, and Linux, and doesn't require a particularly powerful machine to run.
However, its speed/crashiness will scale with how good your computer (particularly GPU I think) is.
Because it is under constant development Blender is constantly being updated with new features, so it can be worth keeping an eye on new releases.
****

![Download](https://github.com/rpdearden/Miscellany/blob/master/Tutorials/Images/Blender_Image1_Download.png "Download")

**Too many menus**
As you load in Blender you'll see a beautiful splash screen: the art (made in Blender) is made by a member of the Blender community and changes with every version.
* Click off it and you'll get a default scene.
* If this is your first time it might be a bit overwhelming, but basically to start with you only need to worry about the **layout tab** and its 3 main sections: **the 3D viewport**, the **outliner**, and the **properties menu**.

![Layout](https://github.com/rpdearden/Miscellany/blob/master/Tutorials/Images/Blender_Image2_Layout.png "Layout")

The most immediately exciting of these is the 3D viewport: you can rotate the view with middle mouse, zoom in and out with the scroll wheel and pan with shift middle mouse.
* Important bits of these we will use are labelled below: the axis thingy (click it to orient the view), the camera view button, the viewport shading menu, and the cube, light, and camera that blender has given you.
* If you select objects in the viewport (by left clicking) they will get an orange outline.
* Once selected you can transform them with hotkeys: g is grab/move, r is rotate, and s is scale. 
* If you want to do these just in one axis press the hotkey then the letter of the axis, e.g. to move the cube in the y axis only, left click it, press g, then x, and then move your mouse.
* Click the camera view button to see what your camera sees.
* Finally, change the view mode using the viewport shading menu.
We'll set up the scene in Solid mode (default), but will use some others later (e.g. render preview uses the lighting/materials)

![Buttons](https://github.com/rpdearden/Miscellany/blob/master/Tutorials/Images/Blender_Image3_Buttons.png "Buttons")

Less interesting but equally important is the outliner.
This has a list of all the objects in your scene: you'll see currently there is the camera, light and the cube. 
* If you select one in the 3D viewport, it will be selected in the outliner (and vice versa).
* You can click the eye and/or camera to make them visible either in the 3D viewport (eye) and/or camera (camera).
* You can see they're organised into groups called collections: we'll use these later.

![Outliner](https://github.com/rpdearden/Miscellany/blob/master/Tutorials/Images/Blender_Image4_Outliner.png "Outliner")


Finally the properties menu, which acts as described really.
* It contains tabs: some of these tabs control the scene as a whole (e.g. render properties)
* Others though are specific to certain objects: you'll see if you select the camera a camera tab will appear, and if you select the light a light tab.
In this tutorial we won't use this that much, but almost anything you want to control is in this massive set of menus somewhere.

![Properties](https://github.com/rpdearden/Miscellany/blob/master/Tutorials/Images/Blender_Image5_Properties.png "Properties")

****

**Setting up a scene**
First things first, we're going to set up a scene.
Cubes are boring so the first thing we'll do is delete it: select it and press x (and click okay).
What's more interesting than cubes?
* Press shift a with your mouse in the 3D viewport and you'll find out.
* Navigate to Mesh > Monkey and click.
* Say hello to Suzanne, the Blender mascot (note she got added where the cursor is, at the scene origin.)

![Suzanne](https://github.com/rpdearden/Miscellany/blob/master/Tutorials/Images/Blender_Image6_Suzanne.png "Suzanne")

Suzanne could do with some more flattering lighting so we will create a three-point lighting set up.
This is a setup often used in photography and will comprise three lights: a key light, a fill light, and a back light.
The key light will be more powerful and will provide most of the lighting, and the other two will allow us to control shadows etc.
We could add lights like the monkey by pressing shift + a, but we actually already have a light in scene.
You'll notice this is a point lamp (there are a few different light types in blender) which radiates in all directions from a point.
* However we want it to be an area lamp, which sends light in one direction from a given area: select it and change this in the light properties tab.
* Then use the hotkeys (s=scale, r=rotate, and g=grab) to position it as your key light, to the left and slightly above Suzanne.
* Once you're happy duplicate this lamp with shift + d, and position these as your fill light and back light.
* Make these about half as powerful as the key light by going into their object properties.

![Lights](https://github.com/rpdearden/Miscellany/blob/master/Tutorials/Images/Blender_Image7_Lights.png "Lights")


Finally the camera angle isn't good for scientific figures, so we will put it straight on.
* Rather than grabbing as before we will do this using object properties: click the camera then in the object properties tab type in the location and rotation properties you want.
* Put it at a position of 0,0,0 with a rotation angle of 90,0,0.
* Then move it out on the y axis a bit with g (grab) then y (contrain to y axis)
* You can use the camera view to make sure you can see Suzanne through the lens.
In this view press g, then z, then z again to scooch the camera towards and away from the subject

![Camera](https://github.com/rpdearden/Miscellany/blob/master/Tutorials/Images/Blender_Image8_Camera.png "Camera")

****

**Scene Organisation**
Our scene is now set up and we ar ready to start making beautiful renders.
HOWEVER before we do we need to organise our scene.
This is deeply tedious but important for keeping track of things.
* Make sure all your objects have sensible names: you can do this in the outliner by double clicking.
* Then put them into three collections: these are like folders for organising things in your blender scene.
* Select an object and place it in a collection by pressing shift + m, then rename the collection like you would an object.
Leave the camera in the Scene collection (rename it Camera).
* Then make a Lights collection with your lights in, and a Suzanne collection with Suzanne in.

![Organisation](https://github.com/rpdearden/Miscellany/blob/master/Tutorials/Images/Blender_Image9_Organisation.png "Organisation")

****

**Rendering**
We have our lights, our cameras, and we are ready for action!
Blender has two main render engines, called Eevee and Cycles: you can flip between these in the Render Properties tab.
Basically Eevee is focussed on doing quick renders, whereas Cycles aims for photorealism.
* We've been in Solid viewport shading so far, but if you swap to Rendered viewport shading it will do a quick and dirty render in the viewport.
* We'll do this tutorial in Eevee as it's quicker but have a play with Cycles if you want: if you swap it with the Rendered viewport you'll see Cycles renders in a pixellated way as it samples each pixel of the image.
* Anyway swap back to Eevee: rendering is as simple as pressing Render, Render image at the top (or bash F12).
* You can use the Output properties tab to change aspects fo your render (e.g. resolution etc).
And voila: you have a rendered image of Suzanne.

![Render](https://github.com/rpdearden/Miscellany/blob/master/Tutorials/Images/Blender_Image10_Render.png "Render")

****

**Materials**
So that's basically all you need for rendering at its simplest, however, you might want to spruce Suzanne up a bit.
You can do this by changing her material properties, you can do this in the material properties of the layout view, but its a bit easier in the dedicated Shading tab at the top.
* Click on shading and you'll see that the upper part of your screen is the view you were in before (i.e. you can click on Suzanne, change the viewport shading) but the bottom is the shader editor.
* If you click New material with Suzanne selected some panels with nodes will appear.
* You can zoom in/out and pan in this shader panel as in the main view (if you can't see anything, it's probably because you're too zoomed in).
These panels are a node-based representation of the shaders being used to give Suzanne (or whatever's selected) her material.
Basically you can plug whatever you want into the output: this is a very powerful system for changing materials.
* However we'll keep it very simple here and stick to the thing we've got plugged in, the Principled BSDF.
* Click on the base colour, change it and you'll notice Suzanne changes colour too.
You can also change other aspects of her material properties here: e.g. roughness (=reflectiveness) or make her metallic.
If you change the colour and render you'll see any changes you make appear in your render.

![Materials](https://github.com/rpdearden/Miscellany/blob/master/Tutorials/Images/Blender_Image11_Materials.png "Materials")

While we're here we can also change the background colour for renders, which can also be manipulated with nodes.
* Click on object in the top left of the shader editor and change it to World.
This is controlled in exactly the same way: change the world colour to black, so the only light is coming from our lamps.

****

**Protoichthyosaurus***
So now we have to tools to render a real bona fide fossil.
* You should have *Protoichthyosaurus* on your computer as a Wavefront file.
* Hide Suzanne and import *Protoichthyosaurus* with File->Import->Wavefront(.obj)
* Name it something sensible and put it in a collection.
* Scale, move and get the ichthyosaur in front of the camera using the hotkeys: use camera view to check it's in the right place.
* We can use the existing lights setup you made for Suzanne.
* Depending on what viewport you're in you'll notice that *Protoichthyosaurus* imports with a texture because its a Wavefront file.
* You can examine this texture in the shading panel: notice the node setup is a bit more complex that what we had for Suzanne.
* If you wanted you could abandon the texture and make it purple or whatever by swapping the setup for a Principled BSDF.
Then hit render, and you have created an image of the Lapworth ichthyosaur! Congratulations.



![Ichthyosaur](https://github.com/rpdearden/Miscellany/blob/master/Tutorials/Images/Blender_Image12_Ichthyosaur.png "Ichthyosaur")

![IchRend](https://github.com/rpdearden/Miscellany/blob/master/Tutorials/Images/Blender_Image13_IchRend.png "IchRend")


****

**Further reading/watching**
This was a very quick whizz through Blender, but you should be able to use the setup here to make images of any 3D fossil material you might find.
Blender can do all sorts that we didn't even touch here: sculpting, modelling, animating, and it can all be scripted with python.
If you're interested in doing more Blender a very good start is the famous donut tutorial [famous donut tutorial by BlenderGuru](https://www.youtube.com/watch?v=TPrnSACiTJ4) (all his stuff is good).
It takes you through lots of basic modelling/materials stuff that we didn't really cover here.
Other than that there are loads of good blender learning materials on Youtube and elsewhere.
E.g. if you want to make a turntable animation like I showed you at the start of the workshop then google Blender turntable animation and you will be spoiled for choice.
Feel free to get in touch if there's something specific you want to do either by coming to find me or dropping me an email at richard.dearden(at)naturalis.nl.
Happy Blending!
****
