# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

unless Rails.env.development?
  module SprocketsCachedLoader
    def initialize(*)
      super
      @expanded_assets_cache = {}
    end
    
    def asset_from_cache(key)
      return @expanded_assets_cache[key] if @expanded_assets_cache.has_key?
      
      asset = cache.get(key, true)
      
      if asset
        asset[:uri]       = expand_from_root(asset[:uri])
        asset[:load_path] = expand_from_root(asset[:load_path])
        asset[:filename]  = expand_from_root(asset[:filename])
        asset[:metadata][:included]     = asset[:metadata][:included].map      { |uri| expand_from_root(uri) } if asset[:metadata][:included]
        asset[:metadata][:links]        = asset[:metadata][:links].map         { |uri| expand_from_root(uri) } if asset[:metadata][:links]
        asset[:metadata][:stubbed]      = asset[:metadata][:stubbed].map       { |uri| expand_from_root(uri) } if asset[:metadata][:stubbed]
        asset[:metadata][:required]     = asset[:metadata][:required].map      { |uri| expand_from_root(uri) } if asset[:metadata][:required]
        asset[:metadata][:dependencies] = asset[:metadata][:dependencies].map  { |uri| uri.start_with?("file-digest://") ? expand_from_root(uri) : uri } if asset[:metadata][:dependencies]

        asset[:metadata].each_key do |k|
          next unless k =~ /_dependencies\z/
          asset[:metadata][k] = asset[:metadata][k].map { |uri| expand_from_root(uri) }
        end
        asset
      end
      
      @expanded_assets_cache[key] = asset
    end
    
    Sprockets::CachedEnvironment.prepend self
  end
end