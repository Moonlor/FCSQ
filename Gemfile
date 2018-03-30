source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

#Use hash function to encrypt user's password
gem 'bcrypt-ruby', '~>3.1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
gem 'bootstrap-sass', '~> 3.3.7'
#Using faker to create fake users
gem 'faker', '~> 1.8.7'
#Use 'will_paginate' and 'bootstrap-will_paginate' to divide users into different pages
gem 'will_paginate', '~> 3.1.6'
gem 'bootstrap-will_paginate', '~> 1.0.0'
gem 'letter_avatar', '~>0.3.6'
gem 'chinese_pinyin'
gem 'materialize-sass'

#Rabbit MQ
gem 'bunny'
gem 'json'

#Active job & sidekiq
gem 'sidekiq'

group :development, :test do
  gem 'listen', '~>3.1.5'
  gem 'sqlite3', '~>1.3.13'
  gem 'rspec-rails', '~>3.7.2'
  gem 'rspec-its', '~>1.2.0'
  gem 'rails-controller-testing', '~>1.0.2'
end

group :test do
  gem 'selenium-webdriver', '~>3.8.0'
  gem 'capybara', '~>2.16.1'
  gem 'factory_girl_rails', '~>4.9.0'
end

gem 'sass-rails', '~>5.0.7'
gem 'uglifier', '~>4.0.2'
gem 'coffee-rails', '~>4.2.2'
gem 'jquery-rails', '~>4.3.1'
gem 'turbolinks', '~>5.0.1'
gem 'jbuilder', '~>2.7.0'

group :doc do
  gem 'sdoc', require: false
end

group :production do
  gem 'pg', '0.21.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
