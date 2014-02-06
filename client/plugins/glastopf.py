import json
import requests

from libs import main

def migrate(config):
	
	# Grab data from glastopf.events
	
	result = main.select(config['honeypot']['glastopf'], 'SELECT * FROM events')
	jeson  = json.dumps( result, separators=(',',':'))
	status = main.knockknock('glastopf_events', jeson, config['api_url'])
	
	if status:
		main.delete(config['honeypot']['glastopf'], 'DELETE FROM events')
