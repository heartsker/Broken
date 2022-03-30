# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

# ignore warnings from a specific pod
# pod '*', :inhibit_warnings => true

target 'Broken' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Broken
  pod 'SwiftLint'

  target 'BrokenTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'BrokenUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end