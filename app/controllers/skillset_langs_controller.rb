class SkillsetLangsController < ApplicationController
  # GET /skillset_langs
  # GET /skillset_langs.json
  def index
    @skillset_langs = SkillsetLang.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skillset_langs }
    end
  end

  # GET /skillset_langs/1
  # GET /skillset_langs/1.json
  def show
    @skillset_lang = SkillsetLang.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skillset_lang }
    end
  end

  # GET /skillset_langs/new
  # GET /skillset_langs/new.json
  def new
    @skillset_lang = SkillsetLang.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skillset_lang }
    end
  end

  # GET /skillset_langs/1/edit
  def edit
    @skillset_lang = SkillsetLang.find(params[:id])
  end

  # POST /skillset_langs
  # POST /skillset_langs.json
  def create
    @skillset_lang = SkillsetLang.new(params[:skillset_lang])

    respond_to do |format|
      if @skillset_lang.save
        format.html { redirect_to @skillset_lang, notice: 'Skillset lang was successfully created.' }
        format.json { render json: @skillset_lang, status: :created, location: @skillset_lang }
      else
        format.html { render action: "new" }
        format.json { render json: @skillset_lang.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /skillset_langs/1
  # PUT /skillset_langs/1.json
  def update
    @skillset_lang = SkillsetLang.find(params[:id])

    respond_to do |format|
      if @skillset_lang.update_attributes(params[:skillset_lang])
        format.html { redirect_to @skillset_lang, notice: 'Skillset lang was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skillset_lang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skillset_langs/1
  # DELETE /skillset_langs/1.json
  def destroy
    @skillset_lang = SkillsetLang.find(params[:id])
    @skillset_lang.destroy

    respond_to do |format|
      format.html { redirect_to skillset_langs_url }
      format.json { head :no_content }
    end
  end
end
