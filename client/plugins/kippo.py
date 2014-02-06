import json
import requests

from libs import main

def migrate(config):
	
	# Grab data from kippo.auth
	
	result = main.select(config['honeypot']['kippo'], 'SELECT id, session, success, hex(username), hex(password), timestamp FROM auth')
	jeson  = json.dumps( result, separators=(',',':'))
	status = main.knockknock('kippo_auth', jeson, config['api_url'])
	
	if status:
		main.delete(config['honeypot']['kippo'], 'DELETE FROM auth')
	
	
	# Grab data from kippo.clients
	
	result = main.select(config['honeypot']['kippo'], 'SELECT * FROM clients')
	jeson  = json.dumps( result, separators=(',',':'))
	status = main.knockknock('kippo_clients', jeson, config['api_url'])
	
	if status:
		main.delete(config['honeypot']['kippo'], 'DELETE FROM clients')
	
	
	# Grab data from kippo.downloads
	
	result = main.select(config['honeypot']['kippo'], 'SELECT * FROM downloads')
	jeson  = json.dumps( result, separators=(',',':'))
	status = main.knockknock('kippo_downloads', jeson, config['api_url'])
	
	if status:
		main.delete(config['honeypot']['kippo'], 'DELETE FROM downloads')
	
	
	# Grab data from kippo.input
	
	result = main.select(config['honeypot']['kippo'], 'SELECT * FROM input')
	jeson  = json.dumps( result, separators=(',',':'))
	status = main.knockknock('kippo_input', jeson, config['api_url'])
	
	if status:
		main.delete(config['honeypot']['kippo'], 'DELETE FROM input')
	
	
	# Grab data from kippo.sessions
	
	result = main.select(config['honeypot']['kippo'], 'SELECT * FROM sessions')
	jeson  = json.dumps( result, separators=(',',':'))
	status = main.knockknock('kippo_sessions', jeson, config['api_url'])
	
	if status:
		main.delete(config['honeypot']['kippo'], 'DELETE FROM sessions')
	
	
	# Grab data from kippo.ttylog
	
	result = main.select(config['honeypot']['kippo'], 'SELECT id, session, hex(ttylog) FROM ttylog')
	jeson  = json.dumps( result, separators=(',',':'))
	status = main.knockknock('kippo_ttylog', jeson, config['api_url'])
	
	if status:
		main.delete(config['honeypot']['kippo'], 'DELETE FROM ttylog')
