#!/usr/bin/python3

import socket

# ip da maquina 
target = '127.0.0.1'
port = 333

server = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
server.bind((target, port))
while 1:
    data, addr = server.recvfrom(1024)
    print('Conectado ao Login',addr[0])
    print('Na porta',addr[1])
    print(data)