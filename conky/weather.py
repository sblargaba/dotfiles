#!/usr/bin/python
import urllib.request
import urllib.parse
import json

city = "" # Add final "," to city string
location = "ITXX0081" # Find yours at http://aspnetresources.com/tools/weatherIdResolver
unit = "c" # Lowercase

# RENDER PARAMETERS
font = ""
bfont = ""
bsize = 12
size = int(bsize*3/4)
bfstring = "${{font {0}:Bold:size={1}}}".format(bfont, bsize)
fstring = "${{font  {0}:size={1}}}".format(font, size)

icon_size = 128
goto = "${{goto {0}}}".format(icon_size + 14)

# WEB PARAMATERS
url = "http://query.yahooapis.com/v1/public/yql"
values = { 
    'q' : 'select item.yweather:condition from weather.forecast where location="' + location + '" and u="' + unit + '"',
    'format' : 'json'
    }


url = url + '?' + urllib.parse.urlencode(values)
query = urllib.request.urlopen(url).read().decode("utf-8")

data = json.loads(query)
data = data['query']['results']['channel']['item']['condition']
#print(data)
print(bfstring + goto + city + data['temp'] + "°" + unit.upper())
print(fstring + goto + data['text'])
print("${image ~/.config/conky/Flat/" + data['code'] + ".png}")

