class ArticleSerializer < ActiveModel::Serializer
  attributes :title, :author

  has_many :sections

  def author
    object.user.full_name
  end
end
