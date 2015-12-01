def workspace
  return 'PMSegmentedControl.xcworkspace'
end

def configuration
  return 'Debug'
end

def targets
  return [
    :ios,
    # :osx,
    # :tvos
  ]
end

def schemes
  return {
    ios: 'PMSegmentedControl-iOS',
    osx: 'PMSegmentedControl-Mac',
    tvos: 'PMSegmentedControl-tvOS'
  }
end

def sdks
  return {
    ios: 'iphonesimulator9.1',
    osx: 'macosx10.11',
    tvos: 'appletvsimulator9.0'
  }
end

def devices
  return {
    ios: [
      "OS='9.1',name='iPhone 6s'",
      "OS='9.1',name='iPhone 6s Plus'",
      "OS='9.1',name='iPad 2'"
    ],
    osx: [
      "arch='x86_64'"
    ],
    tvos: [
      "OS='9.0',name='Apple TV 1080p'"
    ]
  }
end

def run(platform, tasks, xcprety_args: '')
  sdk = sdks[platform]
  scheme = schemes[platform]
  destinations = devices[platform]

  destinations.map { |destination|
    sh "set -o pipefail && xcodebuild -workspace '#{workspace}' -scheme '#{scheme}' -configuration '#{configuration}' -sdk #{sdk} -destination #{destination} #{tasks} | xcpretty -c #{xcprety_args}"
  }
end

desc 'Build, then run tests.'
task :test do
  targets.map { |platform| run platform, 'build test', xcprety_args: '--test' }
  sh "killall Simulator"
end
