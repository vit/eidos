class Eidos::UserGenerator < Rails::Generators::Base
#	source_root ::File.expand_path('../../../../../', __FILE__)

	def create_user
      generate "devise user"
#      generate "devise:views"
#      generate "devise:controllers users"
      rake 'db:migrate'
      rake 'db:setup'


		#puts "!!!!!!!!!!!!!!!!"
		#puts source_paths
		#puts "!!!!!!!!!!!!!!!!"
	end

private

	#def copy_lib
	#	directory "lib/templates/#{options[:template_engine]}"
	#end

end
