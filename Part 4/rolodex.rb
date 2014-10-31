class Rolodex
	attr_reader :contacts
	@@index = 1000

	def initialize
		@contacts = []
	end

	def add_contact(contact)
		contact.id = @@index
		@@index += 1
		@contacts << contact
	end

	def find(contact_id)
    	@contacts.find {|contact| contact.id == contact_id }
  	end

  	def remove_contact(contact)
    	@contacts.delete(contact)
  	end

end