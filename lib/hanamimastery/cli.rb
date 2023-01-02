# frozen_string_literal: true

require 'dry/cli'

module Hanamimastery
  module CLI
    require_relative 'cli/version'
    require_relative 'cli/error'

    extend Dry::CLI::Registry

  end
end
