require 'bundler'
Bundler.require

$LOAD_PATH.unshift(File.expand_path("app", __dir__))

require 'controllers/personal_main_page.rb'

run PersonalPage
