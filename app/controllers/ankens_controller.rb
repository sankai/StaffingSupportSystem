class AnkensController < ApplicationController

  # GET /ankens
  # GET /ankens.json
  def index

    # 1.初期表示（メニューなどからの遷移時）
    #    ログインユーザの部門コードのみを条件に抽出
    #    ①検索条件のクリア
    #    ②ログインユーザの部門コードという条件のみセッションへの保存
    # 2.検索ボタン押下時
    #    画面入力された条件に対して抽出
    #    ①検索条件のクリア
    #    ②画面入力された条件のセッションへの保存
    # 3.ページ繰り時
    #    直前の検索条件をもとにページ繰り
    #    ①検索条件のセッションからの取り出し

    if params[:page].nil?
      # ページ繰り以外
      @searched = Hash.new()
      session[:searched] = @searched
      if params[:commit].nil?
        # 初期表示時：ログインユーザの部門コードという条件のみセッションへの保存
        @searched.store('dept_id', current_user.dept_id)
      else
        # 検索ボタン押下時：画面入力された条件のセッションへの保存
        params[:search].each do | key, value |
          @searched.store(key, value)
        end
      end
    else
      # ページ繰り時：検索条件のセッションからの取り出し
      @searched = session[:searched]
    end
    # まずはページングを指示
    @ankens = Anken.paginate(:page => params[:page], :order => 'id', :per_page => 10)
    
    # 検索条件が指定されていれば、抽出条件としてwhere句を追加
    # 部門コード
    if !(@searched.fetch('dept_id', nil).blank?)
      @ankens = @ankens.where('ankens.dept_id = ?', @searched.fetch('dept_id'))
    end
    # 案件名
    if !(@searched.fetch('ankenname', nil).blank?)
      @ankens = @ankens.where('ankens.name like ?', "%" + @searched.fetch('ankenname') + "%")
    end
    # お客様名
    if !(@searched.fetch('customer', nil).blank?)
      @ankens = @ankens.where('ankens.customer like ?', "%" + @searched.fetch('customer') + "%")
    end
    
    # ドロップリスト用
    @depts  = Dept.all()
	    
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

  # CSV Upload /upload
  def upload
    require 'csv'
	  if !params[:upload_file].blank?
	    reader = params[:upload_file].read
	    CSV.parse(reader) do |row|
	      d = Anken.from_csv(row)
	      d.save()
	    end
	  end
	  redirect_to :action => :index
  end

end
