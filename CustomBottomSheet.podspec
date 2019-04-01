Pod::Spec.new do |s|
  s.name             = 'CustomBottomSheet'
  s.version          = '0.1.0'
  s.summary          = 'CustomBottomSheet provide custom animations with custom view'
 
  s.description      = <<-DESC
CustomBottomSheet provide custom animations with custom view
                       DESC
 
  s.homepage         = 'https://github.com/<nindipuri>/CustomBottomSheet'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '<Narinder SinghE>' => '<nindipuri93@gmail.com>' }
  s.source           = { :git => 'https://github.com/nindipuri/CustomBottomSheet.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'CustomActionSheet/*swift'
 
end