module UserHelper
  def can_delete?(user)
    user == current_user || User.count == 1
  end
end
