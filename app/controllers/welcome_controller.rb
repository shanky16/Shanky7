#
class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about, :element, :contact, :portfolio, :services]

  def index
    if user_signed_in?
      redirect_to index1_path
    end
  end

  def about
  end

  def element
  end

  def contact
  end

  def portfolio
  end

  def services
  end

  def index1
    @role = current_user.role
    if current_user.role == 'admin'
      redirect_to rails_admin_path
    end
  end

end
