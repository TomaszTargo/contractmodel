class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_model
  before_action :set_customer
  before_action :set_answer, only: [:update, :destroy]

  # POST /models
  # POST /models.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to model_customer_path(@model, @customer), notice: 'Model was successfully created.' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to model_customer_path(@model, @customer), notice: 'Model was successfully updated.' }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_model
    @model = Model.find(params[:model_id])
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.require(:answer).permit(:customer_id, :response_id, :term_id, :stage)
  end
end
