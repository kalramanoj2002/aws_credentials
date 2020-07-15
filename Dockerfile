FROM node:12-alpine

# directory where the source code is uploaded
WORKDIR /usr/code/

# Update packages and install bash and gcc
RUN apk update && \
apk upgrade && \
apk add bash gcc

# download dumb-init 
RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 && \
chmod +x /usr/bin/dumb-init

ENV PORT 3000

# Expose port
EXPOSE ${PORT}

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY server.js .

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "-c", "node server.js"]
