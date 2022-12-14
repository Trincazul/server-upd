import unittest
import socket

def test_server_connection():
    # Cria um socket e envia uma mensagem para o servidor
    client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    client.sendto(b"Hello, server!", ("127.0.0.1", 333))

    # Verifica se a mensagem foi recebida pelo servidor corretamente
    received_message = server.recv(1024)
    assert received_message == b"Hello, server!", "Mensagem não recebida pelo servidor corretamente"

# Adiciona a função de teste ao conjunto de testes
def suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(test_server_connection))
    return suite

# Executa o conjunto de testes
unittest.TextTestRunner().run(suite())
