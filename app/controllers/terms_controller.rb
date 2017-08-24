class TermsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_term, only: [:show, :edit, :update, :destroy]
  before_action :set_model

  # GET /terms
  # GET /terms.json
  def index
    @terms = Term.all
  end

  # GET /terms/1
  # GET /terms/1.json
  def show
  end

  # GET /terms/new
  def new
    @term = Term.new
  end

  # GET /terms/1/edit
  def edit
  end

  # POST /terms
  # POST /terms.json
  def create
    @term = Term.new(term_params)
    @term.model_id = @model.id
    respond_to do |format|
      if @term.save
        format.html {
          redirect_to model_terms_url(model_id: @model.id),
            notice: 'Term was successfully created.'
        }
        format.json { render :show, status: :created, location: @term }
      else
        format.html { render :new }
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /terms/1
  # PATCH/PUT /terms/1.json
  def update
    respond_to do |format|
      if @term.update(term_params)
        format.html { redirect_to @term, notice: 'Term was successfully updated.' }
        format.json { render :show, status: :ok, location: @term }
      else
        format.html { render :edit }
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terms/1
  # DELETE /terms/1.json
  def destroy
    @term.destroy
    respond_to do |format|
      format.html { redirect_to terms_url, notice: 'Term was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_term
    @term = Term.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_model
    @model = Model.find(params[:model_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def term_params
    _params = params.require(:term).permit(
      :name, :weight, :description, responses_attributes: []
    )
    params.dig(:term, :responses_attributes).each do |*, v|
      _params[:responses_attributes] = [] unless _params[:responses_attributes]
      _params[:responses_attributes] << v.permit(:response, :points)
    end
    _params
  end
end
