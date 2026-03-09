FROM ubuntu:22.04

# Passo 1: Instalação robusta das dependências
RUN apt-get update && apt-get install -y \
    g++ \
    libboost-all-dev \
    build-essential \
    mailcap

WORKDIR /app

# Passo 2: Copia os arquivos
COPY . .

# Passo 3: Compilação (adicionamos o caminho do Boost explicitamente)
RUN g++ back.cpp -o jogo_exec -I /usr/include -pthread -lboost_system -lboost_filesystem

RUN chmod +x jogo_exec

EXPOSE 18080

CMD ["./jogo_exec"]