class AnkensController < ApplicationController
  # GET /ankens
  # GET /ankens.json
  def index
    @ankens = Anken.all

    respond_to do |format|
      format.html # index.html.erb
      format.csv  { send_data Anken.to_csv }
      format.json { render json: @ankens }
    end
  end

  # GET /ankens/1
  # GET /ankens/1.json
  def show
    @anken = Anken.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @anken }
    end
  end

  # GET /ankens/new
  # GET /ankens/new.json
  def new
    @anken = Anken.new
		@ankenstatuses = Ankenstatus.all()
		@depts = Dept.all()
		
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @anken }
    end
  end

  # GET /ankens/1/edit
  def edit
    @anken = Anken.find(params[:id])
		@ankenstatuses = Ankenstatus.all()
		@depts = Dept.all()
  end

  # POST /ankens
  # POST /ankens.json
  def create
    @anken = Anken.new(params[:anken])

    respond_to do |format|
      if @anken.save
        format.html { redirect_to @anken, notice: 'Anken was successfully created.' }
        format.json { render json: @anken, status: :created, location: @anken }
      else
        format.html { render action: "new" }
        format.json { render json: @anken.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ankens/1
  # PUT /ankens/1.json
  def update
    @anken = Anken.find(params[:id])

    respond_to do |format|
      if @anken.update_attributes(params[:anken])
        format.html { redirect_to @anken, notice: 'Anken was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @anken.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ankens/1
  # DELETE /ankens/1.json
  def destroy
    @anken = Anken.find(params[:id])
    @anken.destroy

    respond_to do |format|
      format.html { redirect_to ankens_url }
      format.json { head :no_content }
    end
  end
end
