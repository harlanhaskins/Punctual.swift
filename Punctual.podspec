Pod::Spec.new do |s|
  s.name        = "Punctual"
  s.version     = "0.0.1"
  s.summary     = "Swift dates, more fun!"
  s.homepage    = "https://github.com/harlanhaskins/Punctual.swift"
  s.license     = { :type => "MIT" }
  s.authors     = { "Harlan Haskins" => "harlan@harlanhaskins.com" }

  s.osx.deployment_target = "10.10"
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/harlanhaskins/Punctual.swift.git", :tag => "0.0.1"}
  s.source_files = "Punctual/Punctual.{h,swift}"
  s.requires_arc = true
end
