Pod::Spec.new do |s|
  s.name = 'RxPhotos'
  s.version = '1.0.1'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'Reactive extensions for Photos framework.'
  s.homepage = 'https://github.com/istered/RxPhotos'
  s.authors = { 'Anton Romanov' => 'istered@outlook.com' }
  s.source = { :git => 'https://github.com/istered/RxPhotos.git', :tag => s.version }
  s.source_files = 'Source/**/*.{h,m,swift}'
  s.swift_version = '4.0'
  s.frameworks = 'UIKit', 'Foundation', 'AVFoundation', 'Photos'

  s.dependency 'RxSwift', '~> 4.0'

  s.ios.deployment_target = '10.0'
end