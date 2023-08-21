class CrewMembersController < ApplicationController
  def index
    @crew_members = CrewMember.all
  end

  def show
    @crew_member = CrewMember.find(params[:id])
  end

  def new
    @crew_member = CrewMember.new
  end

  def create
    @crew_member = CrewMember.new(crew_member_params)
    if @crew_member.save
      redirect_to crew_members_path
    else
      render :new
    end
  end

  def edit
    @crew_member = CrewMember.find(params[:id])
  end

  def update
    @crew_member = CrewMember.find(params[:id])
    if @crew_member.update(crew_member_params)
      redirect_to crew_members_path
    else
      render :edit
    end
  end

  def destroy
    @crew_member = CrewMember.find(params[:id])
    @crew_member.destroy
    redirect_to crew_members_path
  end

  private

  def crew_member_params
    params.require(:crew_member).permit(:name, :description, :boat_id)
  end
end
