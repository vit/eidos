class Eidos::JournalGenerator < Rails::Generators::Base
#	source_root ::File.expand_path('../../../../../', __FILE__)

	def create_journal
      generate 'scaffold journal'
      rake 'db:migrate'
	end

private

	#def copy_lib
	#	directory "lib/templates/#{options[:template_engine]}"
	#end

end
