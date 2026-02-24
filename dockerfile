# 1. Use an official Node.js runtime as the base image
FROM node:18

# 2. Set the working directory inside the container
WORKDIR /usr/src/app

# 3. Copy package.json and package-lock.json (if available)
# This allows Docker to cache your dependencies
COPY package*.json ./

# 4. Install the dependencies listed in your package.json
RUN npm install

# 5. Copy the rest of your application code (like server.js)
COPY . .

# 6. Inform Docker that the container listens on port 3000 at runtime
# Render will automatically map this to the correct external port
EXPOSE 3000

# 7. Define the command to run your app
CMD [ "node", "server.js" ]
