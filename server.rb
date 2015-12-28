require "sinatra"
require "sinatra/base"
require "haml"

class Player < Sinatra::Base
  get "/" do
    haml :index
  end

  get "/play" do
    $driver.go(params[:url])
    redirect to("/")
  end
end
