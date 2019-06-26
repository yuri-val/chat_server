class UserSerializer < ActiveModel::Serializer
  attributes :user_name
  attribute :user_id do
    object.id
  end
  
end
