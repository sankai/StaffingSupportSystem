class AnkenstatusesController < ApplicationController
  # GET /ankenstatuses
  # GET /ankenstatuses.json
  def index
    @ankenstatuses = Ankenstatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ankenstatuses }
    end
  end

  # GET /ankenstatuses/1
  # GET /ankenstatuses/1.json
  def show
    @ankenstatus = Ankenstatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ankenstatus }
    end
  end

  # GET /ankenstatuses/new
  # GET /ankenstatuses/new.json
  def new
    @ankenstatus = Ankenstatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ankenstatus }
    end
  end

  # GET /ankenstatuses/1/edit
  def edit
    @ankenstatus = Ankenstatus.find(params[:id])
  end

  # POST /ankenstatuses
  # POST /ankenstatuses.json
  def create
    @ankenstatus = Ankenstatus.new(params[:ankenstatus])

    respond_to do |format|
      if @ankenstatus.save
        format.html { redirect_to @ankenstatus, notice: 'Ankenstatus was successfully created.' }
        format.json { render json: @ankenstatus, status: :created, location: @ankenstatus }
      else
        format.html { render action: "new" }
        format.json { render json: @ankenstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ankenstatuses/1
  # PUT /ankenstatuses/1.json
  def update
    @ankenstatus = Ankenstatus.find(params[:id])

    respond_to do |format|
      if @ankenstatus.update_attributes(params[:ankenstatus])
        format.html { redirect_to @ankenstatus, notice: 'Ankenstatus was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ankenstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ankenstatuses/1
  # DELETE /ankenstatuses/1.json
  def destroy
    @ankenstatus = Ankenstatus.find(params[:id])
    @ankenstatus.destroy

    respond_to do |format|
      format.html { redirect_to ankenstatuses_url }
      format.json { head :no_content }
    end
  end

end
