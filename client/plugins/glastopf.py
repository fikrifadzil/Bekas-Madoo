import json
import requests

from libs import main

def migrate(config):
	result = main.select(config, 'SELECT * FROM events')
	jeson  = json.dumps( result, separators=(',',':'))
	status = main.knockknock('glastopf_events', jeson, config)
	
	if status:
		main.delete(config, 'DELETE FROM events')
