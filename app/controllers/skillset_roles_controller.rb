class SkillsetRolesController < ApplicationController
  # GET /skillset_roles
  # GET /skillset_roles.json
  def index
    @skillset_roles = SkillsetRole.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skillset_roles }
    end
  end

  # GET /skillset_roles/1
  # GET /skillset_roles/1.json
  def show
    @skillset_role = SkillsetRole.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skillset_role }
    end
  end

  # GET /skillset_roles/new
  # GET /skillset_roles/new.json
  def new
    @skillset_role = SkillsetRole.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skillset_role }
    end
  end

  # GET /skillset_roles/1/edit
  def edit
    @skillset_role = SkillsetRole.find(params[:id])
  end

  # POST /skillset_roles
  # POST /skillset_roles.json
  def create
    @skillset_role = SkillsetRole.new(params[:skillset_role])

    respond_to do |format|
      if @skillset_role.save
        format.html { redirect_to @skillset_role, notice: 'Skillset role was successfully created.' }
        format.json { render json: @skillset_role, status: :created, location: @skillset_role }
      else
        format.html { render action: "new" }
        format.json { render json: @skillset_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /skillset_roles/1
  # PUT /skillset_roles/1.json
  def update
    @skillset_role = SkillsetRole.find(params[:id])

    respond_to do |format|
      if @skillset_role.update_attributes(params[:skillset_role])
        format.html { redirect_to @skillset_role, notice: 'Skillset role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skillset_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skillset_roles/1
  # DELETE /skillset_roles/1.json
  def destroy
    @skillset_role = SkillsetRole.find(params[:id])
    @skillset_role.destroy

    respond_to do |format|
      format.html { redirect_to skillset_roles_url }
      format.json { head :no_content }
    end
  end
end
