class WidgetsController < ApplicationController
  before_action :set_Widget, only: [:show, :edit, :update, :destroy]

  # GET /Widgets
  # GET /Widgets.json
  def index
    @Widgets = Widget.all
  end

  # GET /Widgets/1
  # GET /Widgets/1.json
  def show
  end

  # GET /Widgets/new
  def new
    @Widget = Widget.new
  end

  # GET /Widgets/1/edit
  def edit
  end

  # POST /Widgets
  # POST /Widgets.json
  def create
    @Widget = Widget.new(Widget_params)

    respond_to do |format|
      if @Widget.save
        format.html { redirect_to @Widget, notice: 'Widget was successfully created.' }
        format.json { render :show, status: :created, location: @Widget }
      else
        format.html { render :new }
        format.json { render json: @Widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Widgets/1
  # PATCH/PUT /Widgets/1.json
  def update
    respond_to do |format|
      if @Widget.update(Widget_params)
        format.html { redirect_to @Widget, notice: 'Widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @Widget }
      else
        format.html { render :edit }
        format.json { render json: @Widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Widgets/1
  # DELETE /Widgets/1.json
  def destroy
    @Widget.destroy
    respond_to do |format|
      format.html { redirect_to Widgets_url, notice: 'Widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Widget
      @Widget = Widget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def Widget_params
      params.require(:Widget).permit(:name)
    end
end
