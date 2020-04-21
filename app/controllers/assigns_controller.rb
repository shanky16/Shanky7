#
class AssignsController < ApplicationController

  def index
   @project = Project.where(user_id: current_user.id)
   @tester = User.where(role: 'Tester')
   @designer = User.where(role: 'Designer')
   @developer = User.where(role: 'Developer')
   @assign1 = Assign.where(user_id: current_user).page(params[:page]).per(1)
  end

  def create
    params[:assign][:user_id].each do |uid|
      @dd = Assign.create(user_id: uid, project_id: params[:assign][:project_id])
       end
  end

  def status

    @status=params[:status]
    @assign2= Assign.find_by('user_id = ? and project_id =?',current_user.id, params[:assign] )
    @assign2.update_attributes(status: @status)
  end
end
