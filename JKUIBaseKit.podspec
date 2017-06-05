Pod::Spec.new do |s|
s.name = 'JKUIBaseKit'
s.version = '0.1.2'
s.license = 'MIT'
s.summary = 'Simple APP Kit'
s.homepage = 'https://github.com/lwq718691587/JKUIBaseKit'
s.authors = { '刘伟强' => '718691587@qq.com' }
s.source = { :git => "https://github.com/lwq718691587/JKUIBaseKit.git", :tag => s.version.to_s}

s.requires_arc = true
s.ios.deployment_target = '8.0'

s.dependency 'SVProgressHUD'

s.source_files = 'JKUIBaseKit/**/*'


end
