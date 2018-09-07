class DevelopersController < ApplicationController
  def index
    @programming_language = params[:programming_language]
    @language = params[:language]
    @developers = SearchDeveloperService.new(params).call
    @count = @developers.present? ? @developers.count : 0
  end
end
