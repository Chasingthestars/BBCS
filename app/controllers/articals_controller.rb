class ArticalsController < ApplicationController
  before_action :set_artical, only: [:show, :edit, :update, :destroy]

  # GET /articals
  # GET /articals.json
  def index
    @articals = Artical.all
  end

  # GET /articals/1
  # GET /articals/1.json
  def show
    @artical.read_number +=1
    @artical.save
    
    @replies = @artical.replies
    
#    @replies = Reply.paginate_by_sql("select * from replies where article_id ="+ @artical.id.to_s() ,page: params[:page])
  end

  # GET /articals/new
  def new
    @artical = Artical.new

    @replies = Reply.new
  end

  # GET /articals/1/edit
  def edit
  end

  # POST /articals
  # POST /articals.json
  def create

    @artical = Artical.new(artical_params)
    @artical.user=session[:user_id]

    respond_to do |format|
      if @artical.save
        format.html { redirect_to @artical, notice: 'Artical was successfully created.' }
        format.json { render action: 'show', status: :created, location: @artical }
      else
        format.html { render action: 'new' }
        format.json { render json: @artical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articals/1
  # PATCH/PUT /articals/1.json
  def update
    respond_to do |format|
      if @artical.update(artical_params)
        format.html { redirect_to @artical, notice: 'Artical was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @artical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articals/1
  # DELETE /articals/1.json
  def destroy
    @artical.destroy
    respond_to do |format|
      format.html { redirect_to articals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artical
      @artical = Artical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artical_params
      params.require(:artical).permit(:title, :category, :content, :user, :read_number, :thumber_up_number)
    end
end
