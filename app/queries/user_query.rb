class UserQuery
	attr_reader :relation
	def initialize(base_relation = User.all)
		@relation = base_relation.extending(Scopes)
	end

	module Scopes

		def search_by_user(user)
			user_type = user.user_type
      if user_type == "master"
        return self.where(is_active: true)
      elsif (user_type == "client_admin") || user_type == "client_user"
        client_id = user.client_user.client.id
        
				return user.client_user.client.users
			end
		end

	end
end