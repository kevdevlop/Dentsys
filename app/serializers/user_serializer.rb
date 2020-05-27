class UserSerializer <  ApplicationSerializer
  attributes :id,
    :name,
    :email,
    :last_name,
    :full_name,
    :user_type

  def full_name
    "#{object.name} #{object.last_name}"
  end
end
