# Night Writer

## Refactor 
- I was attempting to add an Parent class for both the night_writer and reader classes. This parent class was called NightCreator and it would store the initialize, creation_message, and write_contents method. I was making the 2 later methods take 2 arguments (incoming, outgoing) this would allow me to pass the correct files to them regardless if I was reading or writing.  

- I was also planning to refactor my convert_to_english method in my night_reader class. I would separate lines 25 - 32 into a method of their own, and then call on that method on the new line 25 of my convert_to_english method. 

- The last method I would go to refactor would be my braille_translator method. I would create the hash outside of the method and call on it again inside of the method. I would then see if there was a way I could refactor lines 45 - 49 outside of the method, but I would need to find out a way to use the braille argument that the braille_translator method is taking in order to do so. 