Conky Weather
=============

Python script that with a YQL query fetches information in JSON format about weather conditions.  
The information are then rendered by conky with the aid of a icon set.  
  
  
![Preview](https://raw.github.com/sblargaba/dotfiles/master/conky/preview.png 
"Preview")

Icons
-----
An icon set is not supplied. You can get one [here](http://lavana.deviantart.com/art/Flat-Weather-Icons-32021664).   
If you want to use another theme remember that an icon representing a condition code must be named after that condition code, in png format. 
[Here](http://developer.yahoo.com/weather/#codes) you can find a list of condition codes that can be represented.

Setup
-----
Python script variables:

  * city        - Location name displayed in bold
  * location    - Location code to retrieve info
  * unit        - Lowercase unit for temperature (c or f)
  * bfont       - Font for bold text (city and temperature)
  * bsize       - Size for bold text
  * font        - Font for regular text (conditions)
  * size        - Size for regular text
  * icon_size   - Size of icon set
  * icon_folder - Full path, must ends with a '/'

Conky variables:

  * set proper `execpi` function in conkyrc: `${execpi 300 ~/.config/conky/weather.py}`

