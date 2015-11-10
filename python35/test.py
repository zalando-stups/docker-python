from __future__ import print_function
import platform
import subprocess
import sys

if sys.stdout.isatty():
    subprocess.call('python')
else:
    print("Platform:", platform.platform())
    print("Python Version:", platform.python_implementation(), platform.python_version())

