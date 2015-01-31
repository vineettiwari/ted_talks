class TalksController < ApplicationController
  
  def index
    @talks = Talk.order(:id)
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new talk_params
    @talk.save
    redirect_to @talk, notice: "Talk Successfully Saved!"
  end

  def show
    @talk = Talk.find params[:id]
    @comment = Comment.new
  end

  def edit
    @talk = Talk.find params[:id]
  end

  def update
    @talk = Talk.find params[:id]
    @talk.update talk_params
    redirect_to talk_path
  end

  def destroy
    @talk = Talk.find params[:id]
    @talk.destroy
    redirect_to talks_path, notice: "Talk Deleted Successfully!"
  end

  private 

  def talk_params
    params.require(:talk).permit(:title, :body)
  end

end
