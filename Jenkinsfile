pipeline
{
  agent any
  stages
  {
    stage ('download the source code from SCM')
    {
      steps
      {
        git branch: 'master', url: 'https://github.com/RahulParkhi/maven-project.git'
      }
    }
    stage ('Compile the code')
    {
      steps
      {
        withMaven(jdk: 'Java', maven: 'Maven')
        {
          sh 'mvn compile'
        }   
      }
    }
    stage ('Build the package')
    {
      steps
      {
        withMaven(jdk: 'Java', maven: 'Maven')
        {
          sh 'mvn package'
        }   
      }
    }
    stage ('Deploy the artifact')
    {
      steps
      {
        // Using the username and passwd methode -
        //deploy adapters: [tomcat9(credentialsId: 'tomcatadmin', path: '', url: 'http://54.144.78.248:8080/')], contextPath: null, war: '**/*.war'
        sshagent(['TomcatSSH'])
        {
          sh 'scp -o StrictHostKeyChecking=no */target/*.war ec2-user@172.31.89.0:/opt/apache-tomcat-9.0.34/webapps'
        }
      }
    }
  }
}
