stage('Cleanup') { 
        properties([parameters([choice(choices: ['test', 'test2'], description: 'please select the org', name: 'orgName'),
        text(defaultValue: 'test', description: 'Please enter the repoName', name: 'repoName'),
        text(defaultValue: '2 month ago', description: 'Please enter how many weeks', name: 'time')])])
        
        repo = params.repoName.split("\n")
        deleteDir()
        for (String reponame : repo){
          checkout changelog: true, poll: true, scm: [
          $class: 'GitSCM',
          branches: [[name: '*']],
          extensions: [[$class: 'CleanCheckout', deleteUntrackedNestedRepositories: true]],
          userRemoteConfigs: [[url: "https://github.com/${params.orgName}/${reponame}", credentialsId: "${GITHUB_CRED_ID}"]]
        ]
    
    sh '''
      set +x
      ls -al
      branch=`git branch --all | grep -v "HEAD*" | grep -v "cleanup" | grep -v "master" | grep -v "develop"`
        set +x
        for k in $branch; do
            ts=`echo ''' + params.time + '''`
           if [ -z "$(git log -1  --since "$ts" -s $k)" ]; then
                name1=`echo "${k#*/}"`
                name=`echo "${name1#*/}"`
                #echo "This is branch $name"
                orgname=`echo ''' + params.orgName + '''`
                rN=`echo ''' + reponame + '''`
           fi
      done
    '''
        }
