module UserHelper
  def can_delete?(user)
    can?(:delete, user) && user != current_user && User.count > 1
  end
end
