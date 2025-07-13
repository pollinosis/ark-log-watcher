Gem::Specification.new do |spec|
    spec.name          = "ark-log-watcher"
    spec.version       = "0.1.0"
    spec.authors       = ["pollinosis"]
    spec.email         = ["1kaguya@protonmail.com"]
  
    spec.summary       = "Monitor ARK:SA logs and send notifications to Discord"
    spec.description   = "A Ruby CLI tool to watch ARK: Survival Ascended log files and send selected lines to Discord via Webhook"
    spec.license       = "MIT"
  
    spec.files         = Dir["lib/**/*.rb"] + ["bin/ark_log_watcher", "README.md", "LICENSE"]
    spec.executables   = ["ark_log_watcher"]
    spec.require_paths = ["lib"]
  
    spec.metadata["homepage_uri"] = "https://github.com/pollinosis/ark-log-watcher"
    spec.metadata["source_code_uri"] = "https://github.com/pollinosis/ark-log-watcher"
    spec.metadata["bug_tracker_uri"] = "https://github.com/pollinosis/ark-log-watcher/issues"
  end
  