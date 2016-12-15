"""
eprint.py ~ A utility module for printing to the standard error stream.
"""

from __future__ import print_function
import sys

# Credit:
# http://stackoverflow.com/questions/5574702/how-to-print-to-stderr-in-python
def eprint(*args, **kwargs):
    """
    Print to the standard error stream.
    """
    print(*args, file=sys.stderr, **kwargs)
    