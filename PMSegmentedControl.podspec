Pod::Spec.new do |s|
  s.name = "PMSegmentedControl"
  s.version = "1.0.0"
  s.summary = "Segmented control for any type of view."
  s.description = <<-DESC
    A fully customizable SegmentedControl that takes Views as segments for easy customizability.
                     DESC
  s.homepage = "https://github.com/petester42/PMSegmentedControl"
  s.license = 'MIT'
  s.author = { "Pierre-Marc Airoldi" => "pierremarcairoldi@gmail.com" }
  s.source = { :git => "https://github.com/petester42/PMSegmentedControl.git", :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Source/*.swift'
  s.frameworks = 'UIKit'
  s.dependency 'Cartography', '~> 0.6'
end
