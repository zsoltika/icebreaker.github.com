require 'sinatra'

set :public => '_site'

get '/' do
	File.read('_site/index.html')
end

get '/:year/:month/:day/:title/?' do
	File.read("_site/#{params[:year]}/#{params[:month]}/#{params[:day]}/#{params[:title]}/index.html")
end

get '/:page/?' do
	pass unless File.exist?("_site/#{params[:page]}/index.html")
	File.read("_site/#{params[:page]}/index.html")
end

get '/tag/:tag/?' do
	File.read("_site/tag/#{params[:tag]}/index.html")
end

run Sinatra::Application
