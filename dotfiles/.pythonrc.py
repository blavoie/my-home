#
# Python Interactive Startup File
# To enable, set PYTHONSTARTUP environment variable to this file

# Automatically enable ptpython if present.

import sys
try:
    from ptpython.repl import embed
except ImportError:
    print("ptpython is not available: falling back to standard prompt")
else:
    sys.exit(embed(globals(), locals()))

