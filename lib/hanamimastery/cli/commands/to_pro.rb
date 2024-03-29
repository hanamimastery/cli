# frozen_string_literal: true

module Hanamimastery
  module CLI
    module Commands
      class ToPRO < Dry::CLI::Command
        desc 'Renders HTML out of Markdown'
        argument :episode, type: :integer, required: :true, desc: "Episode's ID to render"
        option :save, aliases: ['-s'], type: :boolean, default: false, desc: 'Save to file?'

        include Deps[
          repository: 'repositories.episodes',
          transformation: 'transformations.to_pro'
        ]

        def call(episode:, save:, **)
          content = repository.fetch(episode).content
          processed = transformation.call(content)
          repository.replace(episode, processed)
        end
      end
    end
  end
end
