require 'cuba_libre/version'
require 'fileutils'
require 'thor'
require 'pathname'

module CubaLibre
  class Generator < Thor
    map ['-v', '--version'] => :version

    desc 'install', 'Install Cuba Libre into your project'
    method_options path: :string, force: :boolean
    def install
      if cuba_libre_files_already_exist? && !options[:force]
        puts 'Cuba Libre files already installed, doing nothing.'
      else
        install_files
        puts 'Cuba Libre files installed to #{install_path}/'
      end
    end

    desc 'update', 'Update Cuba Libre'
    method_options path: :string
    def update
      if cuba_libre_files_already_exist?
        remove_cuba_libre_directory
        install_files
        puts 'Cuba Libre files updated.'
      else
        puts 'No existing bourbon installation. Doing nothing.'
      end
    end

    desc 'version', 'Show Cuba Libre version'
    def version
      say 'Cuba Libre #{CubaLibre::VERSION}'
    end

    private

    def cuba_libre_files_already_exist?
      install_path.exist?
    end

    def install_path
      @install_path ||= if options[:path]
                          Pathname.new(File.join(options[:path], 'cuba_libre'))
                        else
                          Pathname.new('cuba_libre')
                        end
    end

    def install_files
      make_install_directory
      copy_in_scss_files
    end

    def remove_cuba_libre_directory
      FileUtils.rm_rf('cuba_libre')
    end

    def make_install_directory
      FileUtils.mkdir_p(install_path)
    end

    def copy_in_scss_files
      FileUtils.cp_r(all_stylesheets, install_path)
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, 'core')
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end
