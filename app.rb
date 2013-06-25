require 'sinatra/base'
require 'sqlite3'

require_relative 'lib/concerns/persistable'
require_relative 'lib/concerns/findable'

require_relative 'lib/models/student'

module StudentSite
  class App < Sinatra::Base

    get '/' do
      redirect to('/students')
    end

    get '/students' do
      @students = Student.all
      erb :'students/index'
    end

    get '/students/:name' do
      # @students = Student.all
      @student = Student.find_by_name(params[:name].gsub('-',' '))
      erb :'students/show'
    end
  end
end