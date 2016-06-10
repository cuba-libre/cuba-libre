$:.push File.expand_path('../lib', __FILE__)
require 'cuba_libre/version'

Gem::Specification.new do |s|
  s.add_development_dependency 'aruba', '~> 0.6.2'
  s.add_development_dependency 'css_parser', '~> 1.4.1'
  s.add_development_dependency 'rake', '~> 11.1.2'
  s.add_development_dependency 'rspec', '~> 3.4.0'
  s.add_development_dependency 'scss_lint', '0.48.0'
  s.add_runtime_dependency 'sass', '~> 3.4.22'
  s.add_runtime_dependency 'thor', '~> 0.19.1'
  s.authors = [
    'Alex'
  ]
  s.description = <<-DESC
    UI
  DESC
  s.email = 'devilcoders@gmail.com'
  s.executables = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  s.files = `git ls-files`.split('\n')
  s.homepage = 'http://cuba-libre.us'
  s.license = 'MIT'
  s.name = 'cuba-libre'
  s.platform = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.summary = 'A simple and lightweight mixin library for Sass'
  s.test_files = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.version = CubaLibre::VERSION
end
