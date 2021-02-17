# DayOneRandom
Day One doesn't have a random entry button (yet!), but this web page will allow you 
to go to any random entry that you've put into it. Requires a little work each time 
you write a entry, but it's worth it!

This is designed to be run on a Mac, in Terminal.

1. Make a folder on your Mac in the place of your choice.
2. In DayOne, click on All Entries, then click on File -> Export -> JSON.
3. You may get a popup about download media. Click on Proceed Anyway. You don't need media for this.
4. Save the .zip file to the folder you made in step 1.
5. Go to the folder, and expand the .zip file.
6. Copy the create_random_entry_webpage.bash script from this github page directly into the folder you made in step 1. So in step 1's folder, you'll see the create_random_entry_webpage.bash script, the zip file, and a folder that starts with Export---. 
7. Make sure the file you create is executable. (chmod 700 create_random_entry_webpage.bash)
8. Run the script. (Just type ./create_random_entry_webpage.bash)
9. In the step 1 folder you'll now see an html page called random_entry.html. The easiest way to open it, is go to the Finder app, open the step 1 folder, and double-click the html file.
10. A web page will pop up. It will have a "random" link on it; or if you wait about three seconds, a DayOne page containing a random post should open automagically.

Voila! Random Posts!  :D

# Challenge for code upgrade:
I would like to put a comment with the date of the entry next to each entry ID so I know what date it is from. Some fancy sed operation should be able to extrapolate that info. That way people could remove certain posts from the random entry tool. Another way to remove posts would be to only export certain entries; I'm exploring options for that as well.
