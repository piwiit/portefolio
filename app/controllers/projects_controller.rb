class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
  end

  # GET /projects/new
  def new
    @project = Project.new
    @message = Message.new
  end

  # GET /projects/1/edit
  def edit
    set_project
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @message = Message.new message_params
    if @message.valid?
      MessageMailer.contact(@message).deliver_now
      redirect_to new_message_url
      flash[:notice] =
        'We have received your message and will be in touch soon!'
    else
      flash[:notice] =
        'There was an error sending your message. Please try again.'
      render :new
    end
    respond_to do |format|
      if @project.save
        format.html do
          redirect_to @project, notice: 'Project was successfully created.'
        end
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json do
          render json: @project.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if set_project.update(project_params)
        format.html do
          redirect_to @project, notice: 'Project was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json do
          render json: @project.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    set_project.destroy
    respond_to do |format|
      format.html do
        redirect_to projects_url, notice: 'Project was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:title, :description, :url, :picture)
  end
  def message_params
    params.require(:message).permit(:name, :email, :phone_number, :body)
  end
end
