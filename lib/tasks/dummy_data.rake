namespace :generate do
  task dummy_data: :environment do
    # genarate programming languages data
    programming_languages = %w(ruby java python swift javascript)
    programming_languages.each do |lan|
      ProgrammingLanguage.create(name: lan)
    end

    # genarate languages data
    languages = %w(vi en jp kr cn fr)
    languages.each do |code|
      Language.create(code: code)
    end

    #generate developer data
    100.times do
      developer = Developer.new(email: Faker::Internet.email)
      next unless developer.save

      random_programmming_languages = programming_languages.sample(rand(1..4))
      random_programmming_languages.each do |name|
        programming_language = ProgrammingLanguage.find_by(name: name)
        next unless programming_language
        developer.developer_programming_languages.create(programming_language: programming_language) 
      end

      random_languages = languages.sample(rand(1..4))
      random_languages.each do |code|
        language = Language.find_by(code: code)
        next unless language
        developer.developer_languages.create(language: language) 
      end
    end
  end
end