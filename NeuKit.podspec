Pod::Spec.new do |s|
  s.name             = 'NeuKit'
  s.version          = '0.0.1'
  s.summary          = 'A Neumorphic replacement of Apple UIKit.'
  s.description      = <<-DESC
A Neumorphic replacement of Apple UIKit. Turn your UI to neumorphic style.
                       DESC

  s.homepage         = 'https://github.com/elchief84/NeuKit'
  s.screenshots      = 'http://www.enzoromano.eu/neukit/neukit-views.png', 'http://www.enzoromano.eu/neukit/neukit-buttons.png', 'http://www.enzoromano.eu/neukit/neukit-textfield.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'elchief84' => 'enzxx84@gmail.com' }
  s.source           = { :git => 'https://github.com/elchief84/NeuKit.git', :tag => s.version.to_s }
  
  s.swift_version = '4.0'
  s.ios.deployment_target = '8.0'

  s.source_files = 'NeuKit/Classes/**/*'
  
  
end
