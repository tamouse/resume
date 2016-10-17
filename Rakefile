# Rake tasks

desc "Deploy to site (make up for missing middleman-deploy)"
task :deploy => :build do |_t, _args|
  sh 'rsync -avz --progress --delete build/ tamouse.org:Sites/tamouse.org/resume'
end

desc "Build the site"
task :build do |_t, _args|
  sh 'bundle exec middleman build'
end

desc "Start the middleman server"
task :serve do |_t, _args|
  sh 'bundle exec middleman'
end

task :default => :serve
