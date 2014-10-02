class Search
  include ActiveModel::Model

  attr_accessor :term, :user

  def entries
    user.entries.where("body LIKE ?", "%#{term}%")
  end
end
