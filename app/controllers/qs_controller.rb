class QsController < ApplicationController
  before_action :set_q, only: [:show, :edit, :update, :destroy]

  # GET /qs
  # GET /qs.json
  def index
    @qs = Q.all
  end

  # GET /qs/1
  # GET /qs/1.json
  def show
  end

  # GET /qs/new
  def new
    @q = Q.new
  end

  # GET /qs/1/edit
  def edit
  end

  # POST /qs
  # POST /qs.json
  def create
    @q = Q.new(q_params)

    respond_to do |format|
      if @q.save
        format.html { redirect_to @q, notice: 'Q was successfully created.' }
        format.json { render :show, status: :created, location: @q }
      else
        format.html { render :new }
        format.json { render json: @q.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qs/1
  # PATCH/PUT /qs/1.json
  def update
    respond_to do |format|
      if @q.update(q_params)
        format.html { redirect_to @q, notice: 'Q was successfully updated.' }
        format.json { render :show, status: :ok, location: @q }
      else
        format.html { render :edit }
        format.json { render json: @q.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qs/1
  # DELETE /qs/1.json
  def destroy
    @q.destroy
    respond_to do |format|
      format.html { redirect_to qs_url, notice: 'Q was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_q
      @q = Q.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def q_params
      params.require(:q).permit(:student_id, :questionnaire_id)
    end
end
