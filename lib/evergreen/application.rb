module Evergreen
  class Application < Sinatra::Base
    set :static, false
    set :root, File.expand_path('.', File.dirname(__FILE__))

    def initialize
      super
      @file_index = 0
    end

    helpers do
      def url(path)
        Evergreen.mounted_at.to_s + path.to_s
      end

      def render_spec(spec, file_index)
        content = spec.read if spec
        content.gsub(/^(\s*)require(\s*)\((\s*)\[/, "define(\"spec_test_#{file_index}\",[")
      rescue StandardError => error
        erb :_spec_error, :locals => { :error => error }
      end
    end

    def get_file_index
      @file_index = @file_index + 1
      @file_index - 1
    end

    get '/' do
      @suite = Evergreen::Suite.new
      erb :list
    end

    get '/run/all' do
      @suite = Evergreen::Suite.new
      erb :run
    end

    get '/run/*' do |name|
      @suite = Evergreen::Suite.new
      @spec  = @suite.get_spec(name)
      erb :run
    end

    get "/jasmine/*" do |path|
      send_file File.expand_path(File.join('../jasmine/lib/jasmine-core', path), File.dirname(__FILE__))
    end

    get "/resources/require.js" do
      send_file File.join(Evergreen.root, Evergreen.require_js_path)
    end
    get "/resources/require_js_config.js" do
      send_file File.join(Evergreen.root, Evergreen.require_js_config_path)
    end

    get "/resources/*" do |path|
      send_file File.expand_path(File.join('resources', path), File.dirname(__FILE__))
    end

    get '/*' do |path|
      send_file File.join(Evergreen.root, Evergreen.public_dir, path)
    end

  end
end
