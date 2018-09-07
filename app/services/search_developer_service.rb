class SearchDeveloperService
  attr_reader :programming_language, :language

  def initialize(params= {})
    @result = Developer.includes(:programming_languages, :languages)
    @programming_language = params[:programming_language].presence
    @language = params[:language].presence
  end

  def call
    dev_ids_search_by_programming_language = programming_language.present? ? search_by_programming_language : Developer.pluck(:id)
    dev_ids_search_by_language = language.present? ? search_by_language : Developer.pluck(:id)

    dev_ids = dev_ids_search_by_programming_language & dev_ids_search_by_language

    @result = Developer.where(id: dev_ids).includes(:programming_languages, :languages)
  end

  private
  def search_by_programming_language
    programming_language_list = programming_language.strip.split
    if programming_language_list == []
      developer_ids = Developer.pluck(:id)
    else
      developer_ids = Developer.joins(:programming_languages).where('programming_languages.name IN (?)', programming_language_list).pluck(:id)
    end
  end

  def search_by_language 
    language_list = language.strip.split
    if language_list == []
      developer_ids = Developer.pluck(:id)
    else
      developer_ids = Developer.joins(:languages).where('languages.code IN (?)', language_list).pluck(:id)
    end
  end
end