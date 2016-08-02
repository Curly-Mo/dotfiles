#!/usr/bin/env python
"Helper for setting current desktop's name"

import sys

import xpybutil.ewmh as ewmh

if len(sys.argv) == 2 and sys.argv[1] == '--help':
    print("""
        Usage:\n
            set_desktop_name NAME_OF_NEW_DESKTOP  - sets current desktop name
            set_desktop_name NR NAME_OF_NEW_DESKTOP - sets name of NRth desktop
        """)

if len(sys.argv) > 2:
    desktop_offset = int(sys.argv[1])
    new_name = sys.argv[2]

else:
    desktop_offset = ewmh.get_current_desktop().reply()
    new_name = sys.argv[1]

current_names = ewmh.get_desktop_names().reply()

current_names[desktop_offset] = new_name

# Not sure why I have to do it twice - somehow
# doesn't work if I only call it once
c = ewmh.set_desktop_names(current_names)
c = ewmh.set_desktop_names(current_names)
