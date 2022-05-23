# Rake tasks

desc "Deploy to site (make up for missing middleman-deploy)"
task :deploy => :build do
  rm_rf 'docs'
  cp_r 'build', 'docs'
  sh 'git add --all --verbose'
  sh "git commit -m 'Published #{Time.now.strftime("%FT%T.%Z")}'"
  sh "git push  origin main"
end

desc "Build the site"
task :build do
  sh 'bundle exec middleman build'
end

desc "Start the middleman server"
task :serve do
  sh 'bundle exec middleman'
end

task :default => :serve
