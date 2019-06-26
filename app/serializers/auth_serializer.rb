class AuthSerializer < UserSerializer
  attribute :credentials do
    ::JsonWebToken.encode(user_id: object.id)
  end
end
