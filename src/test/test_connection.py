import unittest
import socket

def test_conection():
    server_address = ("127.0.0.1", 333)
    message = "Connected"
    bytes_sent = str.encode(message)

    client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    client.sendto(bytes_sent, server_address)

    # Verifica se a mensagem foi enviada corretamente
    received_message = client.recv(1024)
    assert received_message == message, "Mensagem de conexão não enviada corretamente"

# Adiciona a função de teste ao conjunto de testes
def suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(test_connection))
    return suite

# Executa o conjunto de testes
unittest.TextTestRunner().run(suite())