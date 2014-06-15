module UsersHelper
  def user_sex_icon(user)
    return if user.male.nil?
    icon=user.male? ? 'male' : 'female'
    fa_icon(icon)
  end
  def user_sex(user)
    return if user.male.nil?
    sex=user.male? ? 'male' : 'female'
    sex
  end
  
end
