'''
Created on 30.09.2023

getLavNrwImages.py

@author: ulpia

This tools downloads all images for a given archival.

Example:
Get the link form DFG Viewer like:
    https://dfg-viewer.de/show/?tx_dlf[id]=https%3A%2F%2Fwww.landesarchiv-nrw.de%2Fdigitalisate%2FAbt_Rheinland%2FAA_0073%2F%7E000%2F00092%2Fmets.xml
or
    https://dfg-viewer.de/show?tx_dlf%5Bdouble%5D=0&tx_dlf%5Bid%5D=https%3A%2F%2Fwww.landesarchiv-nrw.de%2Fdigitalisate%2FAbt_Rheinland%2FAA_0073%2F~000%2F00092%2Fmets.xml&tx_dlf%5Bpage%5D=4&cHash=e516425f5ca06191b1362b412c7e343c

and simplify it to:
    https://www.landesarchiv-nrw.de/digitalisate/Abt_Rheinland/AA_0073/~000/00092/mets.xml
Then use it for variable "url". The program will extract and download all specified images from that xml-file.
'''

import xml.etree.ElementTree as ET
import urllib
import sys
import requests

def main():

    """Customize following two line for your needs."""
    url = 'https://www.landesarchiv-nrw.de/digitalisate/Abt_Rheinland/AA_0073/~000/00092/mets.xml'
    targetDirectory = "c:/temp/"

    response = urllib.request.urlopen(url).read()
    tree = ET.fromstring(response)
    
    for imageFile in tree.findall('./{http://www.loc.gov/METS/}fileSec/{http://www.loc.gov/METS/}fileGrp/{http://www.loc.gov/METS/}file'):
        imageLocation = imageFile.find('./{http://www.loc.gov/METS/}FLocat')
        imageUrl = imageLocation.attrib["{http://www.w3.org/1999/xlink}href"]
        imageFileName = imageUrl.rsplit('/', 1)[1]
        print("Saving " + imageFileName + " to " + targetDirectory)
        r = requests.get(imageUrl, allow_redirects=True)
        open(targetDirectory + imageFileName, 'wb').write(r.content)
        

if __name__ == "__main__":
    main()
