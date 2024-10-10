# frozen_string_literal: true

require 'dry/cli'
require 'hanamimastery/cli/version'
require 'hanamimastery/cli/errors'
require 'hanamimastery/cli/deps'

module Hanamimastery
  module CLI
    extend Dry::CLI::Registry
    register 'touch', Commands::Touch
    register 'unshot', Commands::Unshot
    register 'pro', Commands::ToPRO
    register 'notion', Commands::ToNotion
  end
end
