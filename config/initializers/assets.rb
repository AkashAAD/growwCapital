Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join('node_modules')
File.join(".", "**/*.rb")
Rails.application.config.assets.paths += Dir["#{Rails.root}/vendor/assets/*"].sort_by { |dir| -dir.size }
Rails.application.config.assets.precompile += Dir["#{Rails.root}/app/assets/stylesheets/*"].sort_by { |dir| -dir.size }
Rails.application.config.assets.precompile += Dir["#{Rails.root}/app/assets/stylesheets/users/*"].sort_by { |dir| -dir.size }
Rails.application.config.assets.precompile += Dir["#{Rails.root}/app/assets/stylesheets/personal_admin/*"].sort_by { |dir| -dir.size }
Rails.application.config.assets.precompile += Dir["#{Rails.root}/app/assets/javascripts/*"].sort_by { |dir| -dir.size }
Rails.application.config.assets.precompile += Dir["#{Rails.root}/app/assets/javascripts/users/*"].sort_by { |dir| -dir.size }
Rails.application.config.assets.precompile += Dir["#{Rails.root}/app/assets/javascripts/personal_admin/*"].sort_by { |dir| -dir.size }
# Rails.application.config.assets.precompile += Dir["#{Rails.root}/app/assets/javascripts/personal_admin/*"].sort_by { |dir| -dir.size }
Rails.application.config.assets.precompile += %w( personal_admin.js )