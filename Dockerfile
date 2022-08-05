FROM alpine:3.15.5

WORKDIR /app

# Get Vault
RUN wget https://github.com/channable/vaultenv/releases/download/v0.15.1/vaultenv-0.15.1-linux-musl -O vaultenv
RUN chmod +x vaultenv

# Get Cloudflared
RUN wget https://github.com/cloudflare/cloudflared/releases/download/2022.7.1/cloudflared-fips-linux-amd64 -O cloudflared
RUN chmod +x cloudflared

COPY . .

ENV VAULTENV_SECRETS_FILE=vault.env

RUN chmod +x run.sh

CMD ["./vaultenv", "./run.sh"]
