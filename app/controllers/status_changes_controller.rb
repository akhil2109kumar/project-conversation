class StatusChangesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :authorize_owner!

  def create
    @status_change = @project.status_changes.build(status_change_params.merge(user: current_user))
    if @status_change.save
      @project.update(status: @status_change.status)
      redirect_to @project, notice: "Project status updated."
    else
      redirect_to @project, alert: "Failed to update status."
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def authorize_owner!
    redirect_to @project, alert: "Not authorized." unless @project.user == current_user
  end

  def status_change_params
    params.require(:status_change).permit(:status)
  end
end
