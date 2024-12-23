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
          # 핵심 설정만 유지
          config.build_settings['HEADER_SEARCH_PATHS'] ||= ['$(inherited)']
          config.build_settings['HEADER_SEARCH_PATHS'] << '${PODS_ROOT}'
          
          # 새로운 접근: 프레임워크 설정 변경
          config.build_settings['MACH_O_TYPE'] = 'staticlib'
          config.build_settings['DEFINES_MODULE'] = 'NO'
          config.build_settings['COMBINE_HIDPI_IMAGES'] = 'NO'
          
          # 버전 관련 설정 제거
          config.build_settings.delete('CURRENT_PROJECT_VERSION')
          config.build_settings.delete('VERSIONING_SYSTEM')
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