require File.expand_path(File.join(File.dirname(__FILE__), '../../lib/generators/web_app_theme/theme/theme_base'))

class ThemeGenerator < Rails::Generator::Base
  
  include WebAppTheme::ThemeBase
  
  default_options :app_name => 'Web App',
                  :type => :administration,
                  :theme => :default,
                  :no_layout => false,
                  :engine => :erb
    
  def initialize(runtime_args, runtime_options = {})
    super
    @name = @args.first || (options[:type].to_s == "sign" ? "sign" : "application")
  end
  
  def manifest
    record do |m|
      rails2!(m)
      create_layouts_dir
      create_images_dir
      copy_images
      create_theme_dir
      copy_layout
      copy_base_stylesheet
      copy_theme_override
      copy_theme_stylesheet
      
      # %w(cross key tick application_edit).each do |icon|
      #   m.file("../../images/icons/#{icon}.png", "public/images/web-app-theme/#{icon}.png")
      # end            
      # 
      # m.template("view_layout_#{options[:layout_type]}.html.#{options[:engine]}", File.join("app/views/layouts", "#{@name}.html.#{options[:engine]}")) unless options[:no_layout]
      # m.template("../../stylesheets/base.css",  File.join("public/stylesheets", "web_app_theme.css"))
      # m.template("web_app_theme_override.css",  File.join("public/stylesheets", "web_app_theme_override.css"))
      # m.template("../../stylesheets/themes/#{options[:theme]}/style.css",  File.join("public/stylesheets/themes/#{options[:theme]}", "style.css"))      
    end
  end
  
  def banner
    "Usage: #{$0} theme [layout_name] [options]"
  end
  
  def self.gem_root
    File.expand_path('../../../', __FILE__)
  end
  
  def self.source_root
    File.join(gem_root, 'templates', 'theme')
  end
  
  def source_root
    self.class.source_root
  end
  
protected

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--app_name=app_name", String, "") { |v| options[:app_name] = v }
    opt.on("--type=layout_type", String, "Specify the layout type") { |v| options[:type] = v }
    opt.on("--theme=theme", String, "Specify the theme") { |v| options[:theme] = v }
    opt.on("--no-layout", "Don't create layout") { |v| options[:no_layout] = true }
    opt.on("--engine=haml", "Use HAML instead of ERB template engine") { |v| options[:engine] = v }
  end
  
end
