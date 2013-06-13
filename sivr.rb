require 'rubygems'
require 'sinatra'
require 'twilio-ruby'
 
get '/' do
  Twilio::TwiML::Response.new do |r|
    r.Say "Welcome to TPS - port of IVR from PHP to Ruby"
    r.Gather :numDigits => 1, :action => '/handle-gather', :method => 'get' do |g|
      g.say "For store hours, press 1."
      g.say "To speak to an agent, press 2."
      g.say "To check your package status, press 3."
    end  
  end.text
end


get '/handle-gather' do
  if params['Digits'] == '1'
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Our store hours are 8 AM to 8 PM everyday.'
    end
  else 
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Sorry we can not do that yet'
    end
  end
  response.text
end