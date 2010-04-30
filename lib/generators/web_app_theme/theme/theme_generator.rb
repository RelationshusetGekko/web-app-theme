require File.join(File.dirname(__FILE__), 'theme_base')

module WebAppTheme
  class ThemeGenerator < Rails::Generators::Base
  
  
    class_option :type, :default => :administration
    argument :layout_name, :required => false
    class_option :theme, :default => :default
    class_option :app_name, :default => 'Web App'
    class_option :no_layout, :type => :boolean, :default => false
    class_option :engine, :default => :erb
    
    def generate
      @name = layout_name || (options[:type] == "sign" ? "sign" : "application")
      rails3!
      create_layouts_dir
      create_images_dir
      copy_images
      create_theme_dir
      copy_layout
      copy_base_stylesheet
      copy_theme_override
      copy_theme_stylesheet
    end
    
    include ThemeBase
  
    def banner
      "Usage: #{$0} web_app_theme:theme [layout_name] [options]"
    end
    
    def self.gem_root
      File.expand_path("../../../../../", __FILE__)
    end
  
    def self.source_root
      File.join(gem_root, 'templates', 'theme')
    end
  
  end
end