# Podfile
platform :ios, '16.0'
target 'WeatherDemo' do
  use_frameworks!
  
  pod 'GSCXScanner'
  pod 'abseil', :modular_headers => true
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        if target.name == 'GTXiLib'
          config.build_settings['DEFINES_MODULE'] = 'YES'
          config.build_settings['LINK_WITH_STANDARD_LIBRARIES'] = 'YES'
          config.build_settings['HEADER_SEARCH_PATHS'] = ['$(inherited)', '${PODS_ROOT}']
          config.build_settings['CLANG_ENABLE_MODULES'] = 'YES'
          config.build_settings['EXCLUDED_SOURCE_FILE_NAMES'] = ['GTXiLib_vers.o'] # 중복 심볼 제거
          config.build_settings['OTHER_LDFLAGS'] = '$(inherited) -Xlinker -no_deduplicate'
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