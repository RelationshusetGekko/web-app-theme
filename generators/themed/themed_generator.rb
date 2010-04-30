require File.expand_path(File.join(File.dirname(__FILE__), '../../lib/generators/web_app_theme/themed/themed_base'))

class ThemedGenerator < Rails::Generator::NamedBase
  
  default_options :app_name => 'Web App',
                  :type => :crud,
                  :layout => false,
                  :will_paginate => false,
                  :engine => :erb
  
  attr_reader :controller_routing_path, 
              :singular_controller_routing_path,
              :columns,
              :model_name,
              :plural_model_name,
              :resource_name,
              :plural_resource_name,
              :engine
  
  include WebAppTheme::ThemedBase
  
  def initialize(runtime_args, runtime_options = {})
    super
    @controller_path  = runtime_args.shift
    @table_name       = @controller_path
    @model_name       = runtime_args.shift
    @engine           = options[:engine]
  end
  
  def manifest
    record do |m|
      rails2!(m)
      run_generator
    end
  end
  
  def self.gem_root
    File.expand_path('../../../', __FILE__)
  end
  
  def self.source_root
    File.join(gem_root, 'templates', 'themed')
  end
  
  def source_root
    self.class.source_root
  end
  
protected
  
  def banner
    "Usage: #{$0} themed ControllerPath [ModelName] [options]"
  end
  
  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--app_name=app_name", String, "") { |v| options[:app_name] = v }
    opt.on("--type=themed_type", String, "") { |v| options[:type] = v }    
    opt.on("--layout=layout", String, "Add menu link") { |v| options[:layout] = v }
    opt.on("--with_will_paginate", "Add pagination using will_paginate") { |v| options[:will_paginate] = true }
    opt.on("--engine=haml", "Use HAML instead of ERB template engine") { |v| options[:engine] = v }
  end
  
end
