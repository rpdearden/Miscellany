**This is the workflow I used to get from Mimics to scaled models for Morphomuseum**
***
**In Mimics**
* Segment fossil
* Make scale bar of known length as mask and export at optimal resolution.
* nb above step isn't necessary if plys are exported at scale
***
**In Blender**
* Import models
* Scale to correct size using scale bar
* Change units to micrometers to do this if necessary and manusally scale with shift key
* Batch export as stls using Batch export -> Object dropdown option (not currently possible for plys)
* Make sure the "scene unit" box is ticked 
***
**In MorphoDig**
* Import scaled stls 
* Save as project
* RGB colour codes can be copied and pasted into the .NGP file 
* Add a .tag file to label colours
