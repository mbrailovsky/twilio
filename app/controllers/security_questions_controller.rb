class SecurityQuestionsController < ApplicationController
  before_action :set_security_question, only: [:show, :edit, :update, :destroy]

  # GET /security_questions
  # GET /security_questions.json
  def index
    @security_questions = SecurityQuestion.all
  end

  # GET /security_questions/1
  # GET /security_questions/1.json
  def show
  end

  # GET /security_questions/new
  def new
    @security_question = SecurityQuestion.new
  end

  # GET /security_questions/1/edit
  def edit
  end

  # POST /security_questions
  # POST /security_questions.json
  def create
    @security_question = SecurityQuestion.new(security_question_params)

    respond_to do |format|
      if @security_question.save
        format.html { redirect_to @security_question, notice: 'Security question was successfully created.' }
        format.json { render :show, status: :created, location: @security_question }
      else
        format.html { render :new }
        format.json { render json: @security_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /security_questions/1
  # PATCH/PUT /security_questions/1.json
  def update
    respond_to do |format|
      if @security_question.update(security_question_params)
        format.html { redirect_to @security_question, notice: 'Security question was successfully updated.' }
        format.json { render :show, status: :ok, location: @security_question }
      else
        format.html { render :edit }
        format.json { render json: @security_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /security_questions/1
  # DELETE /security_questions/1.json
  def destroy
    @security_question.destroy
    respond_to do |format|
      format.html { redirect_to security_questions_url, notice: 'Security question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_question
      @security_question = SecurityQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def security_question_params
      params.require(:security_question).permit(:question)
    end
end
