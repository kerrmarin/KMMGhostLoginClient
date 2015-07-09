#
# Be sure to run `pod lib lint GhostLoginClient.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "KMMGhostLoginClient"
  s.version          = "0.1.1"
  s.summary          = "A client library to log into an installation of Ghost"
  s.description      = <<-DESC
                       KMMGhostLoginClient is an Objective-C client for the Ghost authentication API.  

                       DESC
  s.homepage         = "https://github.com/kerrmarin/KMMGhostLoginClient"
  s.license          = 'MIT'
  s.author           = { "Kerr Marin Miller" => "kerr@kerrmarin.com" }
  s.source           = { :git => "https://github.com/kerrmarin/KMMGhostLoginClient.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kerrmarin'

  s.platform     = :ios, '8.4'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'GhostLoginClient' => ['Pod/Assets/*.png']
  }

  s.dependency 'AFNetworking', '~> 2.5.4'
end
