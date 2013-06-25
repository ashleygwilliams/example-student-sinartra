require 'sinatra/base'
require 'sqlite3'

require_relative 'lib/concerns/persistable'
require_relative 'lib/concerns/findable'

require_relative 'lib/models/student'

module StudentSite
  class App < Sinatra::Base

    get '/students' do
      @students = Student.all
      erb :'students/index'
    end

    get '/students/:id' do
      # @students = Student.all
      @student = Student.find_by_id(params[:id])
      erb :'students/show'
    end
  end
end