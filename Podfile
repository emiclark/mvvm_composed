platform :ios, '12.0'
use_frameworks!
inhibit_all_warnings!

target 'TechChallenge' do
    pod 'Xcore', :git => 'https://github.com/zmian/xcore.swift'
    pod 'SnapKit', '~> 4.0'
    pod 'SwiftGen', '~> 6.0'

    post_install do |installer|
      installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          if target.name == "TechChallenge" then
            # Exposing Carthage frameworks
            #
            # Expose `Vendor` (Carthage) directory to Xcore so we can get conditional extensions.
#            config.build_settings['FRAMEWORK_SEARCH_PATHS'] ||= ['$(inherited)', '${PODS_ROOT}/../Vendor']

            # Exposing CocoaPods frameworks
            #
            # Or expose `SnapKit` pod to Xcore so we can get conditional extensions.
            config.build_settings['FRAMEWORK_SEARCH_PATHS'] ||= ['$(inherited)', '${PODS_CONFIGURATION_BUILD_DIR}/SnapKit']
            # Link `SnapKit` framework to Xcore so the conditional canImport flag works.
            config.build_settings['OTHER_LDFLAGS'] ||= ['$(inherited)', '-framework "SnapKit"']
          end
        end
      end
  end
end
