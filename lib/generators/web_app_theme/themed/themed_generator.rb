require 'rails/generators/named_base'
require File.join(File.dirname(__FILE__), 'themed_base')

module WebAppTheme
  class ThemedGenerator < Rails::Generators::NamedBase
    
    class_option :app_name, :default => 'Web App'
    class_option :type, :default => :crud
    class_option :include_layout
    class_option :will_paginate, :default => false
    class_option :engine, :default => :erb
  
    argument :singular_controller_routing_path, :required => false
    
    attr_reader :controller_routing_path, 
                :singular_controller_routing_path,
                :columns,
                :model_name,
                :plural_model_name,
                :resource_name,
                :plural_resource_name,
                :engine

    include ThemedBase
    
    def manifest
      @controller_path = name
      @engine = options[:engine]
      @plural_controller_path  = name
      @model_name       = singular_controller_routing_path
      rails3!
      run_generator
    end
  
    def self.gem_root
      File.expand_path("../../../../../", __FILE__)
    end
  
    def self.source_root
      File.join(gem_root, 'templates', 'themed')
    end
    
    protected
  
    def banner
      "Usage: #{$0} web_app_theme:themed ControllerPath [ModelName] [options]"
    end

  end
end