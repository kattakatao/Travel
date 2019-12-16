# TABIHAMA
 
"TABIHAMA" is a travel introduction and suggestion site for people who like to travel and plan trips with Ruby on Rails.
(「TABIHAMA」は、Ruby on Railsを使用した旅好きや旅行を計画している人向けの旅行紹介&提案サイトです。)

# DEMO
 
# Features
 

 
# Requirement
 
* Ruby 2.5.5
* Rails 5.2.3

# Installation
 
 ```bash
$ rails new app name(アプリケーション名)
```
 
# Usage
 
```bash
git clone https://github.com/kattakatao/Travel.git
cd Travel
rails s -b 0.0.0.0
```

# 使用Gem

 ## 画像アップロード機能
  gem "refile", require: "refile/rails", github: 'manfe/refile',
  gem "refile-mini_magick"

 ## ページネーション機能
  gem 'kaminari', '~> 1.1.1'
 
 ## 検索機能
  gem 'ransack'

 ## 新規登録、ログイン機能
  gem 'devise',
  gem 'omniauth',
  gem 'omniauth-facebook'

 ## .env
  gem 'dotenv-rails'

 ## その他
  gem 'bootstrap-sass', '~> 3.3.6',
  gem "jquery-rails",
  gem 'font-awesome-sass',
  gem 'json',
  gem 'pry-rails'

# Note
 
# Author
 
* Kota Hamanaka
* kattakataojp@gmail.com
 
Have a Nice Trip!
 
Thank you!
