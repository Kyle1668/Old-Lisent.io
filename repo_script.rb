puts ARGV[0]
system('git status')
system('git add .')
system("git commit -m \"#{ARGV[0]}\"")
system('git push heroku master')
system('git push origin master')