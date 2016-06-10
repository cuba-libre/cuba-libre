require 'cuba_libre/generator'

cuba_libre_path = File.expand_path('../../assets', __FILE__)
ENV['SASS_PATH'] = [
  ENV['SASS_PATH'], cuba_libre_path
].compact.join(File::PATH_SEPARATOR)
