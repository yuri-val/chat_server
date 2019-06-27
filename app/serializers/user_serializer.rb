class UserSerializer < ActiveModel::Serializer
  attribute :user_id do
    object.id
  end
  attributes :user_name
end
