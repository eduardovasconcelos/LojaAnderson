# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'


RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION


require File.join(File.dirname(__FILE__), 'boot')
Rails::Initializer.run do |config|

  config.action_controller.session = { 
    :session_key => '32b53526325dc08aecaca619c2f9d0ff',
    :secret => 'eduardooliveiravasconcelos23021982' }


end
require 'will_paginate'



#ActionMailer::Base.server_settings =
 #{
  #  :address => "mail.gmail.com",
   # :domain => "gmail.com",
    #:user_name => "eduardooliveiravasconcelos@gmail.com",
 #   :password => "h4ck3d02",
  #  :authentication => :login
 #}