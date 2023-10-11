FROM node:16.3.0-alpine3.13

# Create app directory
WORKDIR /usr/src/app
fdsfsdsada
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm install
# If you are building your code for production
# RUN npm ci --omit=dev

# Bundle app source
COPY . .

# Expose port 3000 to the outside world  
EXPOSE 3000

CMD [ "node", "app.js" ]