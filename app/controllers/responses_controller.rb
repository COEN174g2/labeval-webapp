class ResponsesController < ApplicationController
  before_action :get_student
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  # GET /responses
  # GET /responses.json
  def index
    if @student
      @responses = @student.responses
    else
      @responses = Response.all
    end
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    @questionnaire_id = params[:questionnaire_id]
    @response = @student.responses.build
    @response.answers.build
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = @student.responses.build(response_params)

    respond_to do |format|
      if @response.save
        format.html { redirect_to student_responses_path(@student, @response), notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { redirect_to student_responses_path(@student, @response), notice: 'You have already submitted the response.'}
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to student_response_path(@student), notice: 'You have already submitted the response.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to student_responses_path(@student), notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def get_student
      @student = Student.find(params[:student_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = @student.responses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:cid, :student_id, :questionnaire_id, answers_attributes: [:choice, :text, :question_id, :student_id])
    end
end
