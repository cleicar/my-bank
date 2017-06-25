# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Dir.glob("#{Rails.root}/app/assets/images/**/").each do |path|
  Rails.application.config.assets.paths << path
end

Dir.glob("#{Rails.root}/app/assets/fonts/**/").each do |path|
  Rails.application.config.assets.paths << path
end

Dir.glob("#{Rails.root}'/vendor/assets/bower_components'/**/").each do |path|
  Rails.application.config.assets.paths << path
end

Dir.glob("#{Rails.root}/app/assets/javascripts/ng-app/**/").each do |path|
  Rails.application.config.assets.paths << path
end

# Precompile additional assets.
# application.js, application.css.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += ['*.js', '*.js.erb', '*.css', '*.scss' '*.jpg', '*.png', '*.eot', '*.woff2', '*.woff', '*.ttf', '*.svg']