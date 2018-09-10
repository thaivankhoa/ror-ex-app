class Api::V1::DevelopersController < ActionController::API 
  def index
    @developers = Developer.includes(:programming_languages, :languages)
    render json: DeveloperSerializer.new(@developers).serializable_hash
  end
end