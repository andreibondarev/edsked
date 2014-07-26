Startup Weekend -- Education Event
========


###Setup Dev environment
-----
**Instructions tested on mac, should be easy to adapt to linux** I'll assume you have git installed, pulled this code down, and are working in a command line at this project root.

> - Install [RVM](http://rvm.io)
> - Install ruby 2.1.2
>   - rvm install 2.1.2 
> - Install bundler
>   - gem install bundler
> - Install mysql5
>   - Create a root user with rootpass as the password (Or modify conf/database.yml to whatever user/pass you use, just don't commit this)
> - Install gem dependencies
>   - bundle install
> - Create db and run migrations
>   - RAILS_ENV=development bundle exec rake db:create db:migrate db:seed
> - Start rails server
>   - RAILS_ENV=development bundle exec rails server

Open browser and hit app at 127.0.0.1:3000

