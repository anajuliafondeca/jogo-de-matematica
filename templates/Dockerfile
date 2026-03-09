FROM ubuntu:22.04

# Instala as ferramentas de compilação para Linux
RUN apt-get update && apt-get install -y \
    g++ \
    libboost-all-dev \
    build-essential \
    mailcap \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copia seus arquivos do Windows para o servidor Linux
COPY . .

# No Linux, não usamos .exe e a ordem das bibliotecas é rígida
RUN g++ back.cpp -o jogo_exec -pthread -lboost_system -lboost_filesystem

# Dá permissão para o servidor rodar o arquivo
RUN chmod +x jogo_exec

EXPOSE 18080

# Comando para iniciar o servidor no Render
CMD ["./jogo_exec"]