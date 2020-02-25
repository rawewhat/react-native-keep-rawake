require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-keep-rawake"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-keep-rawake
                   DESC
  s.homepage     = "https://github.com/rawewhat/react-native-keep-rawake"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Sokdara Cheng" => "chengsokdara@email.com" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/rawewhat/react-native-keep-rawake.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  # ...
  # s.dependency "..."
end

