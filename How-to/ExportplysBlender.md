**Exporting plys**

The code snippet below will batch export all objects from your scene 
import bpy

def export_all_ply(exportFolder)
    objects = bpy.data.objects
	#Forloop for all objects
    for object in objects:
        #Deselects all objects in scene
        bpy.ops.object.select_all(action='DESELECT')
        #selects an object
        object.select_set(state=True)
        #defines export name
        exportName = exportFolder + object.name + '.ply'
        #Exports as ply
        bpy.ops.export_mesh.ply(filepath=exportName,use_selection=True,use_colors=true_)
        
Then run function with:
export_all_ply('../rpdearden/Desktop/Test_plys_col/')
        
To apply a colour that gets exported with the ply in blender you need to use vertex painting (the diffuse colour won't work).

	1. Select an object
	2. change to Vertex Paint Mode
	3. Choose a colour at top
	4. Press shift+K to paint whole model at once
	5. Exit Vertex Paint Mode before running above script
	
To apply a vertex colour to lots of plys at once:
	
	1. Make a mesh a colour with above technique
	2.Use the [Modify] Data Transfer modifier to the mesh you want to copy to
	3. Target the object you want to copy from
	4. Then use ctrl L to Copy the modifier to other desired objects