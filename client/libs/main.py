import base64
import datetime
import MySQLdb
import requests
import sqlite3

from MySQLdb import converters

def getcursor(config, dbms):
	if dbms.lower() == "mysql":
		dbcon = MySQLdb.connect(config['local_db']['mysql']['host'],config['local_db']['mysql']['user'],config['local_db']['mysql']['pass'],config['local_db']['mysql']['name'])
		return dbcon.cursor()
		
	if dbms.lower() == "sqlite":
		dbcon = lite.connect(config['local_db']['sqlite']['path'])
		return dbcon.cursor()

def select(config, query):
	dbcon = MySQLdb.connect(config['local_db']['mysql']['host'],config['local_db']['mysql']['user'],config['local_db']['mysql']['pass'],config['local_db']['mysql']['name'])
	cursor = dbcon.cursor()
	
	try:
		cursor.execute(query)
		results = cursor.fetchall()
		
		data = []
		
		for result in results:
			tempro = []
			length = len(result)
			index  = 0;
			
			while index < length:
				if (type(result[index]) is datetime.datetime):
					tempro.append(result[index].strftime( '%Y-%m-%d %H:%M:%S' ))
				else:
					tempro.append(result[index])
					
				index = index + 1
			
			data.append(tempro);
	except Exception as e:
		print e
	
	dbcon.close()
	
	return data

def delete(config, query):
	dbcon = MySQLdb.connect(config['local_db']['mysql']['host'],config['local_db']['mysql']['user'],config['local_db']['mysql']['pass'],config['local_db']['mysql']['name'])
	cursor = dbcon.cursor()
	
	try:
		cursor.execute(query)
		dbcon.commit()
	except Exception as e:
		dbcon.rollback()
	
	dbcon.close()

def knockknock(medium, json, config):
	data = {"medium": medium, "data":base64.b64encode(json)}
	r = requests.post(config['api_url'] + '/index.php', data=data)
	
	print r.text
	
	if(r.json['status'] == "true"):
		return True
	else:
		return False
