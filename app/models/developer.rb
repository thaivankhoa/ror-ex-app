class Developer < ApplicationRecord
  has_many :developer_languages
  has_many :languages, through: :developer_languages
  has_many :developer_programming_languages
  has_many :programming_languages, through: :developer_programming_languages

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def programming_languages_list
    programming_languages.pluck(:name).join(", ")
  end

  def languages_list
    languages.pluck(:code).join(", ")
  end
end
