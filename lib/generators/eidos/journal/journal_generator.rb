class Eidos::JournalGenerator < Rails::Generators::Base
	source_root ::File.expand_path('../templates/', __FILE__)

	def create_journal
      generate 'scaffold journal title:string description:text'
      rake 'db:migrate'


        template "views/layouts/_nav_journal_links.html.erb", "app/views/layouts/_nav_journal_links.html.erb", force: true
layout_add = <<-END
<%= render partial: 'layouts/nav_journal_links' %>
END
		insert_into_file "app/views/layouts/_nav.html.erb", layout_add, :before => "<!-- insert module links before this line -->\n"


	end

private

	#def copy_lib
	#	directory "lib/templates/#{options[:template_engine]}"
	#end

end
