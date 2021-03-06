Pod::Spec.new do |s|
s.name = 'JKUIBaseKit'
s.version = '0.3.5'
s.license = 'MIT'
s.summary = 'Simple APP Kit'
s.homepage = 'https://github.com/lwq718691587/JKUIBaseKit'
s.authors = { '刘伟强' => '718691587@qq.com' }
s.source = { :git => "https://github.com/lwq718691587/JKUIBaseKit.git", :tag => s.version.to_s}

s.requires_arc = true
s.ios.deployment_target = '8.0'

s.dependency 'SVProgressHUD'

#s.source_files = 'JKUIBaseKit/**/*'

s.public_header_files = 'JKUIBaseKit/JKUIBaseKit.h'

s.source_files = 'JKUIBaseKit/JKUIBaseKit.h'

s.subspec 'JKUIMacro' do |ss|
ss.source_files = "JKUIBaseKit/JKUIMacro","*.{h,m}"
end

s.subspec 'JKSVProgressHUD' do |ss|

ss.dependency 'JKUIBaseKit/JKUIMacro'
ss.source_files = "JKUIBaseKit/JKSVProgressHUD","*.{h,m}"
end

s.subspec 'JKUICategory' do |ss|
ss.dependency 'JKUIBaseKit/JKUIMacro'
ss.source_files = "JKUIBaseKit/JKUICategory","*.{h,m}"
end

s.subspec 'JKCustomUI' do |ss|
ss.source_files = "JKUIBaseKit/JKCustomUI","*.{h,m}"
end

s.subspec 'JKUITableViewController' do |ss|
    ss.source_files = "JKUIBaseKit/JKUITableViewController","*.{h,m}"
    ss.dependency 'MJRefresh'
    ss.dependency 'Masonry'
    ss.dependency 'JKUIBaseKit/JKUIMacro'
end




end
