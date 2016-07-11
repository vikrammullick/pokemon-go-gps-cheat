# pokemon-go-gps-cheat

This is a pokemon go utility made to help you to spawn yourself at chosen locations such as pokestops or gyms. 

Note : You will need a Mac with Xcode installed and an iOS device running pokemon go to use this

How to Use:
1. Download the zip file for the pokemon go gps utility
2. In the unzipped folder, under "pgo-cheat" open pokemon go gps utility.xcworkspace (The white icon with a blue "A" on it") 
3. Plug in iOS device to the Mac computer
4. Run project on iOS device
5. Pick a location on the map in the iOS project running on the iOS device. (Make sure the location is close to where you are. I find that it is more reliable to use locations that are close to me)
6. A gps coordinate should appear at the bottom of the screen. Copy the gps coordinate into the file titled location.gpx in the Xcode project.
7. Run the project again on the iOS device
8. Switch from the gps utility to Pokemon Go without unplugging the the device from the mac
9. On Xcode, under debug click on "Simulate Location" and then on "location"

After following these steps, Pokemomn Go should refresh and put you at the location that you entered in the location.gpx file. This is a very useful method for finding pokemon, gyms, and pokestops. 
