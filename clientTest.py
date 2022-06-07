import socket

def conection():
    serverAdd = ("127.0.0.1", 333)
    mensagem = "Conectado"
    bytesSend = str.encode(mensagem)

    client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    client.sendto(bytesSend, serverAdd)

i = 0
while (i < 10):
    conection()
    i = i + 1
# pode ser utilizado como teste de estresse no servidor     