class PostSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :body,
    :created_at,
    :authorized
  )

  belongs_to(:user)

  def authorized
    object.user == current_user
  end
end
