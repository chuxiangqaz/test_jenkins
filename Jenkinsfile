pipeline {
   agent any

   stages {
      stage('Hello') {
         steps {
            echo 'Hello World'
         }
		 
		 when {
			branch 'master'
			steps {
				echo '这是 MASTER 代码'
			}
		 }
		 
		 when {
			branch 'dev' 
			steps {
				echo '这是 dev 代码'
			}
		 }
      }
   }
}