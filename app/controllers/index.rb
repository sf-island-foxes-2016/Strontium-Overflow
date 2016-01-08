get '/' do
  redirect '/questions'
end

get '/shall' do
  erb :'easter_eggs/shall_we'
end
