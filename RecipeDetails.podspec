Pod::Spec.new do |s|
  s.name             = 'RecipeDetails'
  s.version          = '1.3.0'
  s.summary          = '\'RecipeDetails\' module.'
  s.homepage         = 'https://github.com/iCookbook/RecipeDetails'
  s.screenshots     = 'https://user-images.githubusercontent.com/60363270/200943946-6b736b4d-5516-4919-8dab-6abf6891488e.png', 'ttps://user-images.githubusercontent.com/60363270/200943981-b91e7a58-35d3-4cf4-90aa-e250d04e5572.png', 'https://user-images.githubusercontent.com/60363270/200944012-b6a73c53-7f3a-4f5b-bdd3-747830e338fc.png'
  s.author           = { 'htmlprogrammist' => '60363270+htmlprogrammist@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/iCookbook/RecipeDetails.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'
  s.source_files = 'RecipeDetails/**/*.{swift}'
  
  s.dependency 'CommonUI'
  s.dependency 'Resources'
  s.dependency 'Models'
  s.dependency 'Persistence'
end
