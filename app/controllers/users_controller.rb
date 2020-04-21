#
class UsersController < Devise::RegistrationsController
  before_filter :authenticate_user!

  def index
    super
  end

  def new
    @user = User.new
  end

  def view
  end

  def create
    @user = User.new(pram_parms)
    if @user.save
      flash[:success] = 'Signed up Successfully'
      redirect_to new_user_session_path
    else
      render 'new'
    end
  end

  def edit
    super
  end

  def user_home
  end

  private

  def pram_parms
    params.require(:user).permit(:name.downcase, :password, :email.downcase, :role)
  end
end
