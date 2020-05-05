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
        deploy adapters: [tomcat9(credentialsId: 'tomcatadmin', path: '', url: 'http://54.144.78.248:8080/')], contextPath: null, war: '**/*.war'
      }
    }
  }
}
