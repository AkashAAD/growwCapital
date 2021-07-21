Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join('node_modules')
File.join(".", "**/*.rb")
Rails.application.config.assets.paths += Dir["#{Rails.root}/vendor/assets/*"].sort_by { |dir| -dir.size }
Rails.application.config.assets.precompile += Dir["#{Rails.root}/app/assets/stylesheets/*"].sort_by { |dir| -dir.size }
Rails.application.config.assets.precompile += Dir["#{Rails.root}/app/assets/javascripts/*"].sort_by { |dir| -dir.size }
