class DeveloperSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email

  attribute :programming_language do |object|
    object.programming_languages_list
  end

  attribute :language do |object|
    object.languages_list
  end
end
