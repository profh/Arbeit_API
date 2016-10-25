module V2
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :update, :destroy]

    # GET /projects
    # GET /projects.json
    def index
      @projects = Project.alphabetical.all
      @current_projects = Project.current.alphabetical
      @past_projects = Project.past.alphabetical

      render json: @projects
    end

    # GET /projects/1
    # GET /projects/1.json
    def show
      render json: @project
    end

    # POST /projects
    # POST /projects.json
    def create
      @project = Project.new(project_params)

      if @project.save
        render json: @project, status: :created, location: @project
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /projects/1
    # PATCH/PUT /projects/1.json
    def update
      @project = Project.find(params[:id])

      if @project.update(project_params)
        head :no_content
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end

    # DELETE /projects/1
    # DELETE /projects/1.json
    def destroy
      @project.destroy

      head :no_content
    end

    private

      def set_project
        @project = Project.find(params[:id])
      end

      def project_params
        params.require(:project).permit(:name, :text, :start_date, :end_date, :domain_id, :manager_id)
      end
  end
end