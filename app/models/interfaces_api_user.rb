class InterfacesApiUser < ActiveRecord::Base
  belongs_to :interface
  belongs_to :api_user

   def self.save_interface_api_users(interface_id, api_users)
    create_api_users = api_users.to_a
    InterfacesApiUser.transaction do
      unless create_api_users.empty?
        create_api_users.each do |api_user_id|
          InterfacesApiUser.find_or_create_by(interface_id: interface_id.to_i, api_user_id: api_user_id)
        end
      end
    end
  end
end
