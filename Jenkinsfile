node {
   // The last stage cleans up the local images and workspace
   stage 'Pre-Build Housekeeping'

   // Clean up the Workspace
   deleteDir()

   // The first stage checks out the code from Github
   stage 'Get Code'

   // Get some code from a GitHub repository
   checkout scm

   // Test the application
   stage 'Run Unit Tests'

   // Test the Layout
   dir('tests') {sh "./layout-test.sh"}

   // Test the Index Page
   dir('tests') {sh "./index-test.sh"}

   // The next stage builds the Docker container for our site
   stage 'Build Container'

   // Run the docker build
   dir('src') {sh "docker build -t registry.roundtower.io:5000/training1/lab1:${env.BUILD_NUMBER} ."}

   // The next stage uploads the new container to the docker registry
   stage 'Upload Container'

   // Upload the container
   sh "docker push registry.roundtower.io:5000/training1/lab1:${env.BUILD_NUMBER}"

   // The next stage creates a file with our bulid information in it
   stage 'Create S3 file'

   sh "echo lab1:${env.BUILD_NUMBER} > path.txt"

   // The next stage uploads a file to s3 which will tell the training instance what image to pull
   stage 'Upload S3 file'

   sh "aws s3 cp path.txt s3://cd-workshop/training1/"
}
