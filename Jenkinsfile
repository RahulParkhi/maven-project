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
  }
}
