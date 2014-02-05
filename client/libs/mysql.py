import MySQLdb

class mysql(object):
	
	def __init__(self, config):
		self.dbcon = MySQLdb.connect(config['local_db']['host'],config['local_db']['user'],config['local_db']['pass'],config['local_db']['name'])
	
	def select(table):
		cursor = self.dbcon.cursor
		
		try:
			cursor.execute("SELECT * FROM " + table)
			results = cursor.fetchall()
			
			data = []
			
			for result in results:
				data.append(result);
		except:
			print "Error: unable to fecth data"
		
		return data
