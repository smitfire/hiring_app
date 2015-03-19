module Api
  class JobsController < ApplicationController
    # http://www.ruby-doc.org/core-2.1.3/Array.html
    # http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Constants
    DEFAULT_FIELDS = %w{ title description }

    # http://leopard.in.ua/2012/07/08/using-cors-with-rails/
    after_action :set_access_control_headers

    def index
      result = Job.all
      render json: result
    end

    def show

    end

    def set_access_control_headers
      headers['Access-Control-Allow-Origin'] = "*"
      headers['Access-Control-Request-Method'] = "GET"
    end

  end
end