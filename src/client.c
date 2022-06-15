#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
	
#define PORT	 333
#define MAXLINE 1024
	

int main() {
	int sockfd;
	char buffer[MAXLINE];
	char *mensagem = "Resposta do Client";
	struct sockaddr_in	 servaddr;
	
	// Criação de Socket
	if ( (sockfd = socket(AF_INET, SOCK_DGRAM, 0)) < 0 ) {
		perror("socket creation failed");
		exit(EXIT_FAILURE);
	}
	
	memset(&servaddr, 0, sizeof(servaddr));
		
	// Informação do servidor
	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(PORT);
	servaddr.sin_addr.s_addr = INADDR_ANY;
		
	int n, len;
		
	sendto(sockfd, (const char *)mensagem, strlen(mensagem),
		MSG_CONFIRM, (const struct sockaddr *) &servaddr,
			sizeof(servaddr));
	printf("Mensagem Enviada.\n");
			
	n = recvfrom(sockfd, (char *)buffer, MAXLINE,
				MSG_WAITALL, (struct sockaddr *) &servaddr,
				&len);
	buffer[n] = '\0';
	printf("Servidor : %s\n", buffer);
	
	close(sockfd);
	return 0;
}
