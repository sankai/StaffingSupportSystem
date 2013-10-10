class MembersController < ApplicationController
  # GET /members
  # GET /members.json
  def index
    @members = Member.paginate(:page => params[:page], :order => 'code', :per_page => 10)
    @skillsets = Skillset.all.sort_by{ |model| model.id }  
    respond_to do |format|
      format.html # index.html.erb
      format.csv { send_data Member.to_csv }
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    params[:skillset].each do | id, evaluation |
      skillEvaluation = SkillEvaluation.find(id)
      if skillEvaluation
        skillEvaluation.evaluation = evaluation
        skillEvaluation.save()
      end
    end
    
    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end
  
  # CSV Upload /upload
  def upload
    require 'csv'
	  if !params[:upload_file].blank?
	    reader = params[:upload_file].read
	    CSV.parse(reader) do |row|
	      m = Member.from_csv(row)
	      m.save()
	    end
	  end
	  redirect_to :action => :index
  end
  
end
