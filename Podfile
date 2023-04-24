platform :ios, '10.0'

target 'GarupaTest' do
    pod 'SnapKit', '~> 5.6.0'


  target 'GarupaTestTests' do
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    puts target.name
  end
end
