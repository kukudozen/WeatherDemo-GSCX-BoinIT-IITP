# Podfile
platform :ios, '16.0'
target 'WeatherDemo' do
  use_frameworks!
  # GSCXScanner 라이브러리 추가
  pod 'GSCXScanner'
  pod 'abseil', :modular_headers => true
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      if target.name == 'GTXiLib'
        target.build_configurations.each do |config|
          config.build_settings['HEADER_SEARCH_PATHS'] ||= ['$(inherited)']
          config.build_settings['HEADER_SEARCH_PATHS'] << '${PODS_ROOT}'
        end
      end
    end
  end
  
  target 'WeatherDemoTests' do
    inherit! :search_paths
  end
  target 'WeatherDemoUITests' do
  end
end