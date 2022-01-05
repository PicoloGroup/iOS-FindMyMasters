# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'FindMyMasters' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Find My Masters

  pod 'SQLite.swift'

  ## Firebase
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  
  ### For Email Link/Passwordless Auth
  pod 'Firebase/DynamicLinks'

  ## Pod for Sign in with Google
  pod 'GoogleSignIn'

  ## Pod for Sign in with Facebook
  pod 'FBSDKLoginKit'

  # autolayout
  pod 'SnapKit'

  # activity indicator
  pod 'JGProgressHUD'
  pod 'PKHUD'

  # custom UI
  pod 'Eureka'
  pod 'FlagKit'
  pod 'Parchment'

  # animations
  #pod 'ViewAnimator'
  #pod 'SkeletonView'

  # Data
  pod 'IGListKit'
  pod 'Moya'

  # Debug
  #pod 'FLEX', :configurations => ['Debug']

end

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end