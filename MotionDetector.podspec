
Pod::Spec.new do |s|

 s.name         = "MotionDetector"
 s.version      = "1.0.0"
 s.summary      = "summary"
 s.description  = "description"
 s.homepage     = "http://raywenderlich.com"
 s.license      = "MIT"

 s.author = { "Vlad D" => "vmd1u16@soton.ac.uk" }

 
 s.platform     = :ios, "10.0"

 s.source       = { :git => "https://github.com/vmd1u16/MotionDetector.git", :tag => "1.0.0" }


 s.source_files = "MotionDetector", "MotionDetector/**/*.{h,m,swift}"

 s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end
