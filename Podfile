# Podfile
platform :ios, '16.0'
target 'WeatherDemo' do
  use_frameworks!
  
  pod 'GSCXScanner'
  pod 'abseil', :modular_headers => true
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      if target.name == 'GTXiLib'
        target.build_configurations.each do |config|
          # 헤더 검색 경로
          config.build_settings['HEADER_SEARCH_PATHS'] ||= ['$(inherited)']
          config.build_settings['HEADER_SEARCH_PATHS'] << '${PODS_ROOT}'
          
          # 중복 심볼 해결을 위한 설정
          config.build_settings['DEFINES_MODULE'] = 'NO'
          config.build_settings['CLANG_ENABLE_MODULE_DEBUGGING'] = 'NO'
          config.build_settings['LINK_WITH_STANDARD_LIBRARIES'] = 'NO'
          config.build_settings['OTHER_LDFLAGS'] = '$(inherited) -Xlinker -no_deduplicate -Xlinker -undefined -Xlinker dynamic_lookup'
          
          # 버전 문자열 중복 문제 해결
          config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)']
          config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] << 'GTXiLibVersionString=GTXiLibVersionString_$(CURRENT_PROJECT_VERSION)'
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