import socket, re

def listen(reply):
	print reply
	p1 = re.search("(\d+),(\d+)\)\.", reply).group(1)
	p2 = re.search("(\d+),(\d+)\)\.", reply).group(2)
	port = int(p1) * 256 + int(p2)
	
	l = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	l.connect((SERV, port))
	return l

# Connect to the FTP server ##
SERV = raw_input("Server: ")

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((SERV, 21))
print repr(s.recv(1024))

# Login to the server ##
USER = raw_input("User: ")
PASS = raw_input("Password: ")

s.sendall("USER " + USER + "\r\n")
print repr(s.recv(1024))
s.sendall("PASS " + PASS + "\r\n")
print repr(s.recv(1024))

# Do stuff ##
print(
"Note: At this time this client only supports\n\
       the following commands:\n\
       		ls       get\n\
       		cd       exit\n\
       		ascii    binary\n")

connected = True
while( connected ):
	foobar = raw_input('>> ')
	foobar = foobar.split(' ')
	comm = foobar[0]
	if(len(foobar) > 1):
		path = foobar[1]
	else:
		path = ""
	
	if(comm == "ls"):
		s.sendall("PASV" + "\r\n")
		l = listen(s.recv(1024))
		s.sendall("LIST " + path + "\r\n")
		print s.recv(1024)
		print s.recv(1024)
		print l.recv(1024)
		l.close()
	elif(comm == "cd"):
		s.sendall("CWD " + path + "\r\n")
		print s.recv(1024)
	elif(comm == "get"):
		s.sendall("PASV" + "\r\n")
		l = listen(s.recv(1024))
		s.sendall("RETR " + path + "\r\n")
		print s.recv(1024)
		print s.recv(1024)
		print l.recv(1024)
		l.close()
	elif(comm == "ascii"):
		s.sendall("TYPE A")
		print s.recv(1024)
	elif(comm == "binary"):
		s.sendall("TYPE I")
		print s.recv(1024)
	elif(comm == "exit"):
		s.sendall("QUIT" + "\r\n")
		print s.recv(1024)
		connected = False
	else:
		print "Command is not supported. Try again...\n"




s.close()
