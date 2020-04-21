#
class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @user = User.find(current_user.id)
    authorize! :manage, @user
    @project = Project.new(create_params)
     if @project.save
       flash[:success] = 'Project got created successfully'
       redirect_to show1_path
     else
       render 'new'
     end
  end

  def view1
    @user = User.find(current_user.id)
    authorize! :manage, @user
    @project = Project.where(user_id: current_user.id).page(params[:page]).per(1)

  end

   def update
     @project = Project.find(params[:id])
     if @project.update_attributes(update_params)
       redirect_to show1_path
       flash[:success] = 'Project got updated successfully'
     end
   end

   def show
     @user = User.find(current_user.id)
     authorize! :manage, @user
     @show = Project.all.page(params[:page]).per(3)
   end

   def show1
     @user = User.find(current_user.id)
     authorize! :manage, @user
       @project = Project.where(user_id: current_user.id).page(params[:page]).per(1)
   end

   def edit
     @user = User.find(current_user.id)
     authorize! :manage, @user
     @project = Project.find(params[:id])

    end

    def destroy
      @user = User.find(current_user.id)
      authorize! :manage, @user
      @project = Project.find(params[:id])
      if @project.destroy
        flash[:success] = 'Project got deleted successfully'
        redirect_to view1_path
      end
    end

    def final_status

      @user = User.find(current_user.id)
      authorize! :manage, @user
       @final_status = params[:final_status]
       @pro = Project.find(params[:project_id])
       @pro.update_attributes(:final_status => @final_status)
       redirect_to view1_path
    end

    private

    def create_params
      params.require(:project).permit(:name, :requirements, :domain, :user_id,
      #  :avatar, :document
       )
    end
    def update_params
      params.require(:project).permit(:name, :requirements, :domain,
      #  :avatar, :document
       )
    end
end
