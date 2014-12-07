=begin

require 'rails/commands/commands_tasks'

module Eidos

  class CommandsTasks < Rails::CommandsTasks

    HELP_MESSAGE = <<-EOT
Usage: ei COMMAND [ARGS]
The most common rails commands are:
 generate    Generate new code (short-cut alias: "g")
 console     Start the Rails console (short-cut alias: "c")
 server      Start the Rails server (short-cut alias: "s")
 dbconsole   Start a console for the database specified in config/database.yml
             (short-cut alias: "db")
 new         Create a new Rails application. "rails new my_app" creates a
             new application called MyApp in "./my_app"
In addition to those, there are:
 destroy      Undo code generated with "generate" (short-cut alias: "d")
 plugin new   Generates skeleton for developing a Rails plugin
 runner       Run a piece of code in the application environment (short-cut alias: "r")
All commands can be run with -h (or --help) for more information.
EOT

#=begin
#COMMAND_WHITELIST = %w(plugin generate destroy console server dbconsole runner new version help)
COMMAND_WHITELIST = %w(help)

def run_command!(command)
      command = parse_command(command)
      if COMMAND_WHITELIST.include?(command)
        send(command)
      else
        write_error_message(command)
      end
    end
#=end


      def generate_or_destroy(command)
#        require 'rails/generators'
#        require_application_and_environment!
#        Rails.application.load_generators
#        require_command!(command)
        super
      end



      def write_help_message
        puts HELP_MESSAGE
      end

  end

end

=end
