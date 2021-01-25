#
# Be sure to run `pod lib lint VandMarvelAPI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VandMarvelAPI'
  s.version          = '1.0.0'
  s.summary          = 'Marvel API Request'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This project is API Request to Marvel API
                       DESC

  s.homepage         = 'https://github.com/Vandcarlos/VandMarvelAPI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vandcarlos' => 'vandcarlosjunior@gmai.com' }
  s.source           = { :git => 'https://github.com/Vandcarlos/VandMarvelAPI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_versions = '5.0'

  s.subspec 'Classes' do |ss|
      ss.source_files = 'VandMarvelAPI/Classes/**/*'
  end
  
  # s.resource_bundles = {
  #   'VandMarvelAPI' => ['VandMarvelAPI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'SwiftHash'
end
