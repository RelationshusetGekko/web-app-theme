module WebAppTheme
  module ThemeBase
    
    attr_accessor :m
    
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
    
    protected
    
    def create_directory(location)
      if @rails2
        @m.directory location
      else
        @m.empty_directory location
      end
    end
    
    def copy(from, to)
      # puts "from: #{from}, to: #{to}"
      if @rails2
        @m.file from, to
      else
        @m.copy_file from, to
      end
    end
    
    def rails2!(m)
      @rails2 = true
      @m = m
    end
    
    def rails3!
      @rails2 = false
      @m = self
    end
  end
end