import json
import MySQLdb
import os.path
import requests
import sys

def announce(group, text):
	if group == "WARNING":
		print "\033[93m[WARNING]\033[0m " + text
	
	if group == "SUCCESS":
		print "\033[92m[SUCCESS]\033[0m " + text
	
	if group == "FAIL":
		print "\033[91m[ERROR]\033[0m " + text
		
	if group == "NOTE":
		print "\033[94m[NOTE]\033[0m " + text
	
def test_config():	
	# Attempt to read configuration file
	announce("NOTE", "Checking configuration file...")
	try:
		config_file = open('configuration')
	except IOError:
		announce("FAIL", "The configuration file is missing!")
		sys.exit(0)
	
	# Check configuration structure
	announce("NOTE", "Attempting to initialize system...")
	try:
		config = json.load(config_file)
		config_file.close();
	except ValueError:
		announce("FAIL", "The configuration file is corrupt!")
		sys.exit(0)
	
	# Verify information  given
	announce("NOTE", "Verifying given information...")
	
	
	try:
		r = requests.get(config['api_url'] + '/test');
		config['token'] = r.json['token']
	except TypeError:
		announce("FAIL", "The API url isn't correct!")
		sys.exit(0)
	
	try:
		mysql = MySQLdb.connect(config['local_db']['mysql']['host'],config['local_db']['mysql']['user'],config['local_db']['mysql']['pass'],config['local_db']['mysql']['name'])
		mysql.close()
	except Exception:
		announce("FAIL", "Invalid MySQL authentication!")
		sys.exit(0)
		
	if config['local_db']['sqlite']['path'] != "":
		if not os.path.isfile(config['local_db']['sqlite']['path']):
			announce("FAIL", "SQLite database doesn't exist!")
			sys.exit(0)
	
	return config
