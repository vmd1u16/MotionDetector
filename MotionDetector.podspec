
Pod::Spec.new do |s|

 s.name         = "MotionDetector"
 s.version      = "1.0.0"
 s.summary      = "Motion Detector is an SDK that abstracts the raw sensor data."
 s.description  = "Motion Detector provides implementations for 4 different types of activities which can be tracked: Bicep curl counter, Star-Jumps counter, Inside-Outside Pocket, Running Stairs"
 s.homepage     = "https://github.com/vmd1u16/MotionDetector.git"
 s.license      = "MIT"

 s.author = { "Vlad D" => "vmd1u16@soton.ac.uk" }

 
 s.platform     = :ios, "10.0"

 s.source       = { :git => "https://github.com/vmd1u16/MotionDetector.git", :tag => "1.0.0" }


 s.source_files = "MotionDetector", "MotionDetector/**/*.{h,m,swift}"

 s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end
