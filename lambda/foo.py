from __future__ import print_function

import json
 
from datetime import datetime

#####

def handler(event, context):
    print(datetime.now())
    print(json.dumps(event, indent=4))
    return
