#!/usr/bin/python

# Mass SSH
# It helps to have a public key on the target servers first...

import os
import sys

if (len(sys.argv) !=  2):
 print "Usage: " + sys.argv[0] + " <command>"
 exit()
command = sys.argv[1]

file = open('envi.list', 'r')
machines = file.read()
file.close()

for machine in machines.split('\n'):
 if machine and machine[0] != '#':
  os.system("ssh "+machine+" \""+sys.argv[1]+"\"")
