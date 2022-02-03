#!/bin/python3.8

from sys import argv
from googletrans import Translator

if len(argv) == 1 :
    exit( "Input is empyt" )
elif len(argv) >1 and argv[1] == "-":
    import fileinput
    text = "".join( line for line in fileinput.input() )
else:
    text = " ".join( argv[1:] )

print(  Translator().translate( text ,dest='zh-TW' ).text , end="") 
