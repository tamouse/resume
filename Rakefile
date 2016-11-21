# Rake tasks

desc "Deploy to site (make up for missing middleman-deploy)"
task :deploy => :docs do |_t, _args|
    sh 'git add --all'
    sh "git commit -m 'Published #{Time.now.strftime("%FT%T.%Z")}'"
    sh "git push -fu origin HEAD"
end

desc "Transfer build to docs"
task :docs => :build do |_t, _args|
  cp_r 'build', 'docs'
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
