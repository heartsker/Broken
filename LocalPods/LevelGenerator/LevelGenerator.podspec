Pod::Spec.new do |spec|

  spec.name = 'LevelGenerator'
  spec.version = '0.1.0'
  
  spec.summary = 'LevelGenerator provides functionality to generate and export levels'

  spec.homepage = 'Local'
  spec.author = { "Daniel Pustotin" => "daniel.pustotin@gmail.com" }
  spec.source = { :path => '*' }

  spec.ios.deployment_target = '12.0'
  spec.static_framework = true

  spec.source_files = 'LevelGenerator/**/*.{swift}'
end
  
