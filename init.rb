require 'rubygems'
require 'sinatra'
require 'haml'
require 'ninesixty'
require 'json'
require 'excelsior'
require 'sinatra/r18n'
require 'RedCloth'

class Saimiri < Sinatra::Base
  register Sinatra::R18n
  set :root, File.dirname(__FILE__)
  set :translations,   './public/translations'
  set :default_locale, 'es'

  before do

    #session[:locale] = params[:locale] if params[:locale]
    
  end


  get '/' do
   haml :'en/pages/index',{:layout => :'en/layout'} 
  end


  get '/projects' do
   haml :'en/pages/projects' ,{:layout => :'en/pageLayout'}
   
  end

  get '/road_to_corcovado' do
   haml :'en/pages/road_to_corcovado',{:layout => :'en/pageLayout'}
  end

  get '/contact' do
   haml :'en/pages/contact',{:layout => :'en/pageLayout'}
  end

  get '/volunteer' do
   haml :'en/pages/volunteer',{:layout => :'en/pageLayout'}
  end 

  def render_file(filename)
    contents = File.read('views/'+filename+'.haml')
    Haml::Engine.new(contents).render
  end
  
end