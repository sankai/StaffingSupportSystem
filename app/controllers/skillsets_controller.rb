class SkillsetsController < ApplicationController
  # GET /skillsets
  # GET /skillsets.json
  def index
    @skillsets = Skillset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skillsets }
    end
  end

  # GET /skillsets/1
  # GET /skillsets/1.json
  def show
    @skillset = Skillset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skillset }
    end
  end

  # GET /skillsets/new
  # GET /skillsets/new.json
  def new
    @skillset = Skillset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skillset }
    end
  end

  # GET /skillsets/1/edit
  def edit
    @skillset = Skillset.find(params[:id])
  end

  # POST /skillsets
  # POST /skillsets.json
  def create
    @skillset = Skillset.new(params[:skillset])

    respond_to do |format|
      if @skillset.save
        format.html { redirect_to @skillset, notice: 'Skillset was successfully created.' }
        format.json { render json: @skillset, status: :created, location: @skillset }
      else
        format.html { render action: "new" }
        format.json { render json: @skillset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /skillsets/1
  # PUT /skillsets/1.json
  def update
    @skillset = Skillset.find(params[:id])

    respond_to do |format|
      if @skillset.update_attributes(params[:skillset])
        format.html { redirect_to @skillset, notice: 'Skillset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skillset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skillsets/1
  # DELETE /skillsets/1.json
  def destroy
    @skillset = Skillset.find(params[:id])
    @skillset.destroy

    respond_to do |format|
      format.html { redirect_to skillsets_url }
      format.json { head :no_content }
    end
  end
end
