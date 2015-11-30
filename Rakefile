def workspace
  return 'PMSegmentedControl.xcworkspace'
end

def targets
  return [
    :ios,
    #:osx,
    #:tvos
  ]
end

def schemes
  return {
    ios: 'PMSegmentedControl',
    #osx: '',
    #tvos: ''
  }
end

def sdks
  return {
    ios: 'iphonesimulator9.1',
    # osx: 'macosx10.11',
    # tvos: 'appletvsimulator9.0'
  }
end

def devices
  return {
    ios: [
      "OS='9.1',name='iPhone 6s'",
      "OS='9.1',name='iPhone 6s Plus'",
      "OS='9.1',name='iPad 2'"
    ],
    # osx: [
    #   "arch='x86_64'"
    # ],
    # tvos: [
    #   "OS='9.0',name='Apple TV 1080p'"
    # ]
  }
end

def run_tests(workspace, platform, xcprety_args: '--test')
  configuration = 'Debug'
  sdk = sdks[platform]
  scheme = schemes[platform]
  destinations = devices[platform]
  tasks = 'build test'

  destinations.map { |destination|
    sh "set -o pipefail && xcodebuild -workspace '#{workspace}' -scheme '#{scheme}' -configuration '#{configuration}' -sdk #{sdk} -destination #{destination} #{tasks} | xcpretty -c #{xcprety_args}"
  }

  sh "killall Simulator"
end

desc 'Build, then run tests.'
task :test do
  targets.map { |platform| run_tests workspace, platform }
end
