require 'rake'

require 'rake'
Gem::Specification.new do |spec|
  spec.name = 'doublecheck'
  spec.summary = 'Check URLs listed in a sitemap'
  spec.description = 'Check URLs in a sitemap to make sure you have not introduced any issues.'
  spec.homepage = 'https://github.com/nathanhumbert/doublecheck'
  spec.version = '0.3'
  spec.authors = ['Nathan Humbert']
  spec.email = ['nathan.humbert@gmail.com']
  spec.executables << 'doublecheck'
  spec.files = [
    'README.markdown',
    'MIT_LICENSE',
  ]
  spec.files += FileList['lib/**/*.rb', 'bin/*']
  spec.test_files = FileList['tests/**/*.rb']
  spec.license = 'MIT'
  spec.add_dependency('nokogiri', '>= 1.4.3.1')
  spec.add_development_dependency('fakeweb')
  spec.add_development_dependency('mocha')

end
