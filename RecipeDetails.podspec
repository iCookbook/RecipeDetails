Pod::Spec.new do |s|
  s.name             = 'RecipeDetails'
  s.version          = '0.1.0'
  s.summary          = '\'RecipeDetails\' module.'
  s.homepage         = 'https://github.com/htmlprogrammist/RecipeDetails'
  s.author           = { 'htmlprogrammist' => '60363270+htmlprogrammist@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/htmlprogrammist/RecipeDetails.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'
  s.source_files = 'RecipeDetails/**/*.{swift}'

  s.dependency 'CommonUI'
  s.dependency 'Resources'
  s.dependency 'Networking'
  s.dependency 'Models'
end