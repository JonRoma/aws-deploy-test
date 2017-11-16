from __future__ import print_function

import json
 
def handler(event, context):
    print(json.dumps(event, indent=4))
    return
