#
module ApplicationHelper
  def name
    @name = current_user.name
  end


end
