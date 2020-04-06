module RubyHamlJs
  class Engine < Rails::Engine
    initializer "ruby-hamljs.configure_rails_initialization", :after => 'sprockets.environment', :group => :all do |app|
      require 'ruby-haml-js/template'
      Sprockets.module_eval do
        register_mime_type 'text/hamljs', extensions: ['.hamljs', '.jst.hamljs']
        register_transformer 'text/hamljs', 'application/javascript+function', ::RubyHamlJs::Template
      end
    end
  end
end

