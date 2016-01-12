get '/' do
  redirect '/posts'
end

get '/session-viewer' do
  session.inspect
end


