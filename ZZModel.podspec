
Pod::Spec.new do |s|


  s.name         = "ZZModel"
  s.version      = "1.0.1"
  s.summary      = "这是一个字典转模型的库"


  s.homepage     = "https://github.com/754340156"


  s.license = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "赵哲" => "754340156@qq.com" }

  s.source       = { :git => "https://github.com/754340156/ZZModel.git", :tag => "#{s.version}" }


  s.source_files  = "ZZModel/ZZModel/*.{h,m}"
 s.requires_arc = true

end
