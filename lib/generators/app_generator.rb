require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Eidos
  class AppGenerator < Rails::Generators::AppGenerator
    #class_option :skip_test_unit, :type => :boolean, :aliases => '-T', :default => true,
    #  :desc => 'Skip Test::Unit files'

    def finish_template
      invoke :eidos_customization
      super
    end

    def eidos_customization
      invoke :customize_gemfile
      generate 'eidos:install'
      generate 'eidos:user'
#      generate 'eidos:journal'

#      invoke :generate_install
#      invoke :generate_user
#      invoke :generate_journal

#      generate ""
      #invoke :setup_development_environment
      #invoke :setup_test_environment
      #invoke :setup_production_environment
      #invoke :setup_staging_environment
      #invoke :setup_secret_token
      #invoke :create_suspenders_views
      #invoke :setup_coffeescript
      #invoke :configure_app
      #invoke :setup_stylesheets
      #invoke :install_bitters
      #invoke :copy_miscellaneous_files
      #invoke :customize_error_pages
      #invoke :remove_routes_comment_lines
      #invoke :setup_git
      #invoke :setup_database
      #invoke :create_heroku_apps
      #invoke :create_github_repo
      #invoke :setup_segment_io
      #invoke :setup_bundler_audit
      #invoke :outro
    end

    def customize_gemfile
      gem 'bootstrap-sass', '~> 3.3.1'
      gem 'autoprefixer-rails'
      #gem 'bootstrap-generators', '~> 3.3.1'

      gem 'bcrypt', '~> 3.1.7'
      gem 'devise' #, '~> 0.0.0'
#      gem 'devise-i18n-views'
      gem 'devise-i18n-views', '~> 0.3.2'

      gem 'eidos', '~> 0.0.0'

      inside app_name do
        run 'bundle install'
      end

#      gsub_file 'Gemfile', /^(gem 'spring')/, '#\0'
    end
 
=begin
    def generate_install
      generate 'eidos:install'
#      generate "devise:install"
#      template 'app0/views/layouts/application.html.erb', 'app/views/layouts/application.html.erb', force: true
#      template 'app/views/layouts/application_0.html.erb', 'app/views/layouts/application_1.html.erb', force: true
#      template 'app/views/layouts/application.html.erb' #, force: true
    end

    def generate_user
      generate 'eidos:user'
    end

    def generate_journal
      generate 'scaffold journal'
      rake 'db:migrate'
    end
=end

=begin
    def setup_database
      say 'Setting up database'

      if 'postgresql' == options[:database]
        build :use_postgres_config_template
      end

      build :create_database
    end

    def setup_development_environment
      say 'Setting up the development environment'
      build :raise_on_delivery_errors
      build :raise_on_unpermitted_parameters
      build :provide_setup_script
      build :provide_dev_prime_task
      build :configure_generators
      build :configure_i18n_for_missing_translations
    end

    def setup_test_environment
      say 'Setting up the test environment'
      build :set_up_factory_girl_for_rspec
      build :generate_rspec
      build :configure_rspec
      build :configure_background_jobs_for_rspec
      build :enable_database_cleaner
      build :configure_spec_support_features
      build :configure_travis
      build :configure_i18n_for_test_environment
      build :configure_i18n_tasks
      build :configure_action_mailer_in_specs
    end

    def setup_production_environment
      say 'Setting up the production environment'
      build :configure_newrelic
      build :configure_smtp
      build :enable_rack_deflater
      build :setup_asset_host
    end

    def setup_staging_environment
      say 'Setting up the staging environment'
      build :setup_staging_environment
    end

    def setup_secret_token
      say 'Moving secret token out of version control'
      build :setup_secret_token
    end

    def create_suspenders_views
      say 'Creating suspenders views'
      build :create_partials_directory
      build :create_shared_flashes
      build :create_shared_javascripts
      build :create_application_layout
    end

    def setup_coffeescript
      say 'Setting up CoffeeScript defaults'
      build :remove_turbolinks
    end

    def configure_app
      say 'Configuring app'
      build :configure_action_mailer
      build :configure_time_zone
      build :configure_time_formats
      build :configure_rack_timeout
      build :disable_xml_params
      build :fix_i18n_deprecation_warning
      build :setup_default_rake_task
      build :configure_unicorn
      build :setup_foreman
    end

    def setup_stylesheets
      say 'Set up stylesheets'
      build :setup_stylesheets
    end

    def install_bitters
      say 'Install Bitters'
      build :install_bitters
    end

    def setup_git
      if !options[:skip_git]
        say 'Initializing git'
        invoke :setup_gitignore
        invoke :init_git
      end
    end

    def create_heroku_apps
      if options[:heroku]
        say 'Creating Heroku apps'
        build :create_heroku_apps
        build :set_heroku_remotes
        build :set_heroku_rails_secrets
        build :set_memory_management_variable
      end
    end

    def create_github_repo
      if !options[:skip_git] && options[:github]
        say 'Creating Github repo'
        build :create_github_repo, options[:github]
      end
    end

    def setup_segment_io
      say 'Setting up Segment.io'
      build :setup_segment_io
    end

    def setup_gitignore
      build :gitignore_files
    end

    def setup_bundler_audit
      say "Setting up bundler-audit"
      build :setup_bundler_audit
    end

    def init_git
      build :init_git
    end

    def copy_miscellaneous_files
      say 'Copying miscellaneous support files'
      build :copy_miscellaneous_files
    end

    def customize_error_pages
      say 'Customizing the 500/404/422 pages'
      build :customize_error_pages
    end

    def remove_routes_comment_lines
      build :remove_routes_comment_lines
    end

    def outro
      say 'Congratulations! You just pulled our suspenders.'
      say "Remember to run 'rails generate airbrake' with your API key."
    end
=end

=begin
    def run_bundle
      # Let's not: We'll bundle manually at the right spot
    end
=end

    protected

#    def get_builder_class
#      Eidos::AppBuilder
#    end

#    def using_active_record?
#      !options[:skip_active_record]
#    end
  end
end


