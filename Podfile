# Podfile
platform :ios, '16.0'
target 'WeatherDemo' do
  use_frameworks!
  
  pod 'GSCXScanner'
  pod 'abseil', :modular_headers => true
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      # GTXiLib 설정
      if target.name == 'GTXiLib'
        target.build_configurations.each do |config|
          config.build_settings['HEADER_SEARCH_PATHS'] ||= ['$(inherited)']
          config.build_settings['HEADER_SEARCH_PATHS'] << '${PODS_ROOT}'
          # 중복 심볼 문제 해결을 위한 설정
          config.build_settings['DEFINES_MODULE'] = 'NO'
          config.build_settings['OTHER_LDFLAGS'] = '$(inherited) -Xlinker -no_deduplicate'
        end
      end
      
      # 모든 타겟에 대한 공통 설정
      target.build_configurations.each do |config|
        # 경고 메시지 줄이기
        config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = 'YES'
        config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
      end
    end
  end
  
  target 'WeatherDemoTests' do
    inherit! :search_paths
  end
  target 'WeatherDemoUITests' do
  end
end