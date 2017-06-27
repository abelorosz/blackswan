use_frameworks!
inhibit_all_warnings!

project 'BlackSwan.xcodeproj'

target 'BlackSwan' do

	platform :ios, '10.0'

	pod 'Moya', '8.0.5'
	pod 'ObjectMapper', '2.2.7'
	pod 'SwiftLocation', '2.0.7'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
