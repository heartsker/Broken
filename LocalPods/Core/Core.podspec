Pod::Spec.new do |spec|

  spec.name = "Core"
  spec.version = "0.1.0"
  
  spec.summary = "Core module provides basic functionality and data structures"

  spec.homepage = "Local"
  spec.author = { "Daniel Pustotin" => "daniel.pustotin@gmail.com" }
  spec.source = { :path => "*" }

  spec.ios.deployment_target = "12.0"
  spec.static_framework = true

  spec.source_files = "#{spec.name}/**/*.{swift}"
end