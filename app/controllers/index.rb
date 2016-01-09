get '/' do
  redirect '/questions'
end

get '/session-viewer' do
  session.inspect
end


