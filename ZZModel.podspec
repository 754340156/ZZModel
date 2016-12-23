
Pod::Spec.new do |s|


  s.name         = "ZZModel"
  s.version      = "0.0.1"
  s.summary      = "A short description of ZZModel."

  s.description  = <<-DESC
                   DESC

  s.homepage     = "http://EXAMPLE/ZZModel"


  s.license = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "赵哲" => "754340156@qq.com" }

  s.source       = { :git => "https://github.com/754340156/ZZModel.git", :tag => "#{s.version}" }


  s.source_files  = "ZZModel/ZZModel/*.{h,m}”
 s.requires_arc = true

end
