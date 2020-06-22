class WidgetsController < ApplicationController
  before_action :set_widget, only: [:show, :edit, :update, :destroy]

  # GET /widgets
  # GET /widgets.json
  def index
    @widgets = widget.all
  end

  # GET /widgets/1
  # GET /widgets/1.json
  def show
  end

  # GET /widgets/new
  def new
    @widget = widget.new
  end

  # GET /widgets/1/edit
  def edit
  end

  # POST /widgets
  # POST /widgets.json
  def create
    @widget = widget.new(widget_params)

    respond_to do |format|
      if @widget.save
        format.html { redirect_to @widget, notice: 'widget was successfully created.' }
        format.json { render :show, status: :created, location: @widget }
      else
        format.html { render :new }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /widgets/1
  # PATCH/PUT /widgets/1.json
  def update
    respond_to do |format|
      if @widget.update(widget_params)
        format.html { redirect_to @widget, notice: 'widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @widget }
      else
        format.html { render :edit }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.json
  def destroy
    @widget.destroy
    respond_to do |format|
      format.html { redirect_to widgets_url, notice: 'widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_widget
      @widget = widget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def widget_params
      params.require(:widget).permit(:name)
    end
end
