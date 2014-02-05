#!/usr/bin/python

import importlib
import os
import requests
import time

from libs import init

print ""
config = init.test_config()
init.announce("SUCCESS", "You are well to go.")

for file in os.listdir("plugins/"):
	if file.endswith(".py") and not file.startswith("__init__"):
		plugin = importlib.import_module("plugins." + file[:-3])
		plugin.migrate(config)
