class Eidos::UserGenerator < Rails::Generators::Base
	source_root ::File.expand_path('../templates/', __FILE__)

	def create_user
#      directory "models/", "app/models/"

      generate "devise user"

text = <<-END
def full_name
	self.email
end
END
		insert_into_file "app/models/user.rb", text, :after => "class User < ActiveRecord::Base\n"

      directory "controllers/", "app/controllers/"
      directory "views/", "app/views/"
		insert_into_file "config/routes.rb", "resources :profile, only: [:show]\n", :after => "Rails.application.routes.draw do\n"



        template "views/layouts/_nav_user_links.html.erb", "app/views/layouts/_nav_user_links.html.erb", force: true
layout_add = <<-END
<%= render partial: 'layouts/nav_user_links' %>
END
		insert_into_file "app/views/layouts/_nav.html.erb", layout_add, :before => "<!-- insert user links before this line -->\n"


#      generate "devise:views"
#      generate "devise:controllers users"
      rake 'db:migrate'
      rake 'db:setup'


	end

private

	#def copy_lib
	#	directory "lib/templates/#{options[:template_engine]}"
	#end

end
