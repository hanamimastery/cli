require 'zeitwerk'
require 'dry-system'

module Hanamimastery
  module CLI
    class Container < Dry::System::Container
      use :zeitwerk

      configure do |config|
        root = File.expand_path("../../..", __dir__)
        config.root = root
        config.autoloader.tag = "hanamimastery-cli"
        config.autoloader.inflector = Zeitwerk::GemInflector.new("#{root}/hanamimastery-cli.rb")
        config.autoloader.push_dir(root)
        config.autoloader.ignore(
          "#{root}/hanamimastery-cli.rb",
          "#{root}/hanamimastery/cli/{errors,version,deps,container}.rb"
        )

        config.inflector = Dry::Inflector.new do |inflections|
          inflections.acronym('CLI')
          inflections.acronym('PRO')
        end

        config.component_dirs.add 'lib' do |dir|
          dir.namespaces.add "hanamimastery/cli", key: nil
        end
      end
    end
  end
end
