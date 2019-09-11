require 'sinatra'
require 'action_mailer'
require_relative 'mailer'

get '/verify' do
  Mailer.verify(params).deliver_now
end
