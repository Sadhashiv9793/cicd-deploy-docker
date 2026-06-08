### CI/CD, a Self-Hosted Runner + Docker ###

# Target Architecture

Git Push
   |
   v
GitHub Repository
   |
   v
GitHub Actions
   |
   v
MSI-LAPTOP (Self Hosted Runner)
   |
   +--> Checkout Code
   +--> npm install
   +--> npm test
   +--> docker build
   +--> docker stop old container
   +--> docker run new container
   |
   v
Application Running




Example Project Structure: 

cicd-deploy-docker/
│
├── src/
│   ├── controllers/
│   ├── routes/
│   └── app.ts
│
├── package.json
├── package-lock.json
├── .env
├── Dockerfile
├── .dockerignore
│
└── .github/
    └── workflows/
        └── deploy.yml

# Run the server 
npm run start

# Main FIle app.js

# Build locally (create the image in Docker-desktop)
docker build -t node-api .

# Run the image inside the container
docker run -d --name node-api -p 3000:3000 node-api

    -> -d (Detached mode): Runs the container in the background so it doesn't lock up your terminal window.

    -> -p 3000:3000 (Port mapping): Maps port 3000 of your physical PC to port 3000 inside the isolated Docker container. This is what allows you to type http://localhost:3000 into your web browser and actually see your "Hello World!" message.

    -> --name my-express-app: Gives your running container a friendly, readable name so you don't have to reference it by a random string of numbers.

## Important commands for docker ##

# To see your running container: 
docker ps

# To see your application logs: 
docker logs my-express-app

# To stop the app: 
docker stop my-express-app

# Remove the container 
docker rm my_container_name

## Pro: Remove and Run 
# Run this if you already cleared the name using Option 1
docker run -d --rm -p 3000:3000 --name node-api node-api

# To see all containers on your system (both the running ones and the hidden, stopped ones)
docker ps -a

# Deploy Commands

-> deploy: only executes all the other commands in the right sequence.

-> deploy:docker-build: executed the build process and gives a name to the image (in this case test-server)

-> deploy:start-container: runs an image of our test-server image, names it (again using test-server, but could be anything) and configures it to expose the internal container’s port 3000, to the external port 3000. More details on publishing ports in docker can be found here.

-> deploy:remove-container: removes a previously created container. The first time we run the deploy, no container would be there and the command would exit with an error code, breaking our process. To avoid this we add a “|| true” at the end, which bypasses the error.

-> deploy:stop-container: very similarly to the deploy:remove-container command, this one tries to stop a container and if no container is found it does not exit with an error code.


# GitHUb Actions 
GitHub Repository
→ Settings
→ Actions
→ Runners
→ New self-hosted runner

# Start the GitHub Action server for jobs 
cmd: .\run.cmd

Ex: PS C:\actions-runner> .\run.cmd

