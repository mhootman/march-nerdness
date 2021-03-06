class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :provider, type: String
  field :uid, type: String
  field :name, type: String

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

end
