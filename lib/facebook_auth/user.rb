module FacebookAuth
  module User
    extend ActiveSupport::Concern
    
    included do
      serialize :facebook_attrs, Hashie::Mash
      attr_accessible :facebook_attrs, :facebook_uid
    end
    
    module ClassMethods
      def find_or_create_from_auth_hash(auth_hash)
        user = find_or_initialize_by_facebook_uid(auth_hash['uid'])
        user.facebook_attrs = auth_hash['extra']['raw_info']
        user.save!
        user
      end      
    end
  end
end