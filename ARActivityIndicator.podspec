#
# Be sure to run `pod lib lint ARActivityIndicator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ARActivityIndicator'
  s.version          = '1.0'
  s.summary          = 'ARActivityIndicator allow you to show indicator for a process'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
"ARActivityIndicator allow you to show indicator for a process. You can easily show and hide with a single line of code."
                       DESC

  s.homepage         = 'https://github.com/AbdulRehmanWarraich/ARActivityIndicator.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AbdulRehman Warraich' => 'ar.warraich@outlook.com' }
  s.source           = { :git => 'https://github.com/AbdulRehmanWarraich/ARActivityIndicator.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ARActivityIndicator/Classes/**/*'
   s.swift_version = '4.2'
  
  # s.resource_bundles = {
  #   'ARActivityIndicator' => ['ARActivityIndicator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
