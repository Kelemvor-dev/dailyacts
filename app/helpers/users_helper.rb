module UsersHelper
	def conversation_interlocutor(conversation)
    	conversation.recipient == current_user ? conversation.sender : conversation.recipient
  	end
  	
  	def resource_name
    :user
	end

	def resource
	@resource ||= User.new
	end

	def devise_mapping
	@devise_mapping ||= Devise.mappings[:user]
	end
end
