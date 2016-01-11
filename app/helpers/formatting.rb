helpers do
  def store_return_to
  session[:return_to] = request.url
  end

end
