// Jenkinsfile
@Library('javajob@java') _
pipeline {
  agent any
  stages {
    stage( 'Hello' ){
	  steps {
	    sh 'ls -la'
		touch(file:"hello.txt")
		sh 'ls -la'
	  }
	}
  }
}
