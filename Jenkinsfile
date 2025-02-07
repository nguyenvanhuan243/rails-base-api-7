pipeline {
    agent any

    environment {
        RUBY_VERSION = '3.0.1'  // Replace with your Ruby version
        BUNDLE_PATH = 'vendor/bundle'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/huannv-solazu/rails_7_base_api.git'
            }
        }

        stage('Setup') {
            steps {
                sh 'bundle install --path vendor/bundle --jobs 4 --retry 3'
            }
        }

        stage('Database Setup') {
            steps {
                sh 'bundle exec rake db:create db:migrate RAILS_ENV=test'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'bundle exec rake test'
            }
        }

        stage('Deploy') {
            steps {
                // Add deployment steps if applicable
            }
        }
    }

    post {
        success {
            echo 'Build successful! Deploying...'
            // Add post-build actions like deployment or notifications
        }

        failure {
            echo 'Build failed!'
            // Add actions for failed builds
        }
    }
}
