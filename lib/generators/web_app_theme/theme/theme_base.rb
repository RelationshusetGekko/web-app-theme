require File.join(File.dirname(__FILE__), '../generator_base')

module WebAppTheme
  module ThemeBase
    
    include GeneratorBase
    
    def run_generator
      create_layouts_dir
      create_images_dir
      copy_images
      create_theme_dir
      copy_layout
      copy_base_stylesheet
      copy_theme_override
      copy_theme_stylesheet
    end
    
    def create_layouts_dir
      create_directory "app/views/layouts"
    end
  
    def create_images_dir
      create_directory "public/images/web-app-theme"
    end
  
    def copy_images
      %w(cross key tick application_edit).each do |icon|
        copy("../../images/icons/#{icon}.png", "public/images/web-app-theme/#{icon}.png")
      end
    end
  
    def create_theme_dir
      create_directory "public/stylesheets/themes/#{options[:theme]}/"
    end
  
    def copy_layout
      @m.template "view_layout_#{options[:type]}.html.#{options[:engine]}", File.join('app/views/layouts', "#{@name}.html.erb") unless options[:no_layout]
    end
  
    def copy_base_stylesheet
      @m.template("../../stylesheets/base.css",  File.join("public/stylesheets", "web_app_theme.css"))
    end
  
    def copy_theme_override
      copy("../../templates/theme/web_app_theme_override.css",  File.join("public/stylesheets", "web_app_theme_override.css"))
    end
  
    def copy_theme_stylesheet
      copy("../../stylesheets/themes/#{options[:theme]}/style.css",  File.join("public/stylesheets/themes/#{options[:theme]}", "style.css"))
    end
    
  end
end