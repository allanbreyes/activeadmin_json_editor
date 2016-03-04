# coding: utf-8
require File.expand_path('../lib/activeadmin/json_editor/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "activeadmin_json_editor"
  spec.version       = ActiveAdmin::JsonEditor::VERSION
  spec.authors       = ["wild"]
  spec.email         = ["wild.exe@gmail.com"]
  spec.summary       = %q{add "json_input" field type to active_admin that allow to edit Postgresql json values}
  spec.description   = %q{"json_input" field allow to edit json value as json array with using jsoneditor.js from http://jsoneditoronline.org}
  spec.homepage      = "https://github.com/wild-r/activeadmin_json_editor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_rubygems_version = ">= 1.3.6"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_dependency "railties", ">= 3.0", "< 5.0"
  #spec.add_development_dependency "rake", "~> 0"
  #spec.add_dependency "active_admin", "~> 1.0.0"
end
