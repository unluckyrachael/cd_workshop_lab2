node {
   // The last stage cleans up the local images and workspace
   stage 'Pre-Build Housekeeping'

   // Clean up the Workspace
   deleteDir()

   // The first stage checks out the code from Github
   stage 'Get Code'

   // Get some code from a GitHub repository
   checkout scm

   // The next stage creates a file with our bulid information in it
   stage 'Create S3 file'

   dir('registry') {sh "./promote.sh training1"}
}
