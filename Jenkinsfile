pipeline {
   agent any

   stages {
		stage("deploy to test") {
			when {
				branch 'dev'
				steps {
					echo 'dev'
				}
			}
		}

		stage("deploy to prod") {
			when {
				branch 'matser'
				steps {
				echo 'master to prod'
				}
			}
		}

   }
}