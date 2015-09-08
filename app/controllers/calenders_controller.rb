
class CalendersController < ApplicationController
  before_action :set_calender, only: [:show, :edit, :update, :destroy]

  # GET /calenders
  # GET /calenders.json
  def index
    @calenders = Calender.all
    if @calenders.empty? or !@calenders.where(year: Time.now.strftime('%Y').to_i).size != 12
      new
    end

    @calenders = Calender.all
  end

  # GET /calenders/1
  # GET /calenders/1.json
  def show
  end

  # GET /calenders/new
  def new
    1.upto 12 do |month|
      @calender = Calender.new
      m = Time.local(Time.now.year, month, 1).strftime('%m')
      y = Time.local(Time.now.year, month, 1).strftime('%Y')

      next unless Calender.where(month: m, year: y).empty?

      @calender.month = m
      @calender.year  = y

      1.upto(Time.now.end_of_month.day) do |day|
        @calender.days << Day.new(name: day.to_i)
      end
      @calender.save
    end
  end

  # GET /calenders/1/edit
  def edit
  end

  # POST /calenders
  # POST /calenders.json
  def create
    @calender = Calender.new(calender_params)

    respond_to do |format|
      if @calender.save
        format.html { redirect_to @calender, notice: 'Calender was successfully created.' }
        format.json { render :show, status: :created, location: @calender }
      else
        format.html { render :new }
        format.json { render json: @calender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calenders/1
  # PATCH/PUT /calenders/1.json
  def update
    respond_to do |format|
      if @calender.update(calender_params)
        format.html { redirect_to @calender, notice: 'Calender was successfully updated.' }
        format.json { render :show, status: :ok, location: @calender }
      else
        format.html { render :edit }
        format.json { render json: @calender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calenders/1
  # DELETE /calenders/1.json
  def destroy
    @calender.destroy
    respond_to do |format|
      format.html { redirect_to calenders_url, notice: 'Calender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calender
      @calender = Calender.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calender_params
      params.require(:calender).permit(:month)
    end
end
