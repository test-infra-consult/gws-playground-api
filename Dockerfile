FROM node:16.3.0 as builder
USER node

# Create app directory
WORKDIR /home/node/

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY --chown=node:node ["package.json", "package-lock.json", "./"]
RUN npm install
# If you are building your code for production
# RUN npm ci --omit=dev

# Bundle app source
COPY . .

RUN ["/bin/bash", "-c", "find . ! -name app.js ! -name node_modules ! -name public ! -name routes ! -name views -maxdepth 1 -mindepth 1 -exec rm -rf {} \\;"]

FROM node:16.3.0-alpine3.13

USER node

WORKDIR /home/node/

COPY --chown=node:node --from=builder /home/node/ ./

# Expose port 3000 to the outside world  
EXPOSE 3000

ENTRYPOINT ["node", "app.js"]
