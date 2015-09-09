class WorkDaysController < ApplicationController
  before_action :set_work_day, only: [:show, :edit, :update, :destroy]

  # GET /work_days
  # GET /work_days.json
  def index
    @year  = params[:year]
    @month = params[:month]
    @day   = params[:day]
    calender = Calender.where(year: @year, month: @month).first
    day = calender.days.where(name: @day)
    @work_days = day.first.work_days
  end

  # GET /work_days/1
  # GET /work_days/1.json
  def show
  end

  # GET /work_days/new
  def new
    @year  = params[:year]
    @month = params[:month]
    @day   = params[:day]
    @work_day = WorkDay.new
  end

  # GET /work_days/1/edit
  def edit
    @year  = params[:year]
    @month = params[:month]
    @day   = params[:day]
  end

  # POST /work_days
  # POST /work_days.json
  def create
    @year  = params[:year]
    @month = params[:month]
    @day   = params[:day]

    calender = Calender.where(year: @year, month: @month).first
    day = calender.days.where(name: @day)

    @work_day = WorkDay.new(work_day_params)

    respond_to do |format|
      if @work_day.save
        day.first.work_days << @work_day
        day.first.save
        format.html { redirect_to controller: 'calenders', action: 'show', id: calender.id,
                                  notice: 'Work day was successfully created.'}
      else
        format.html { redirect_to controller: 'days', action: 'index' }
      end
    end
  end

  # PATCH/PUT /work_days/1
  # PATCH/PUT /work_days/1.json
  def update
    @year  = params[:year]
    @month = params[:month]
    @day   = params[:day]

    calender = Calender.where(year: @year, month: @month).first
    day = calender.days.where(name: @day)

    respond_to do |format|
      if @work_day.update(work_day_params)
        format.html { redirect_to controller: 'calenders', action: 'show', id: calender.id,
                                  notice: 'Work day was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_day }
      else
        format.html { render :edit }
        format.json { render json: @work_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_days/1
  # DELETE /work_days/1.json
  def destroy
    @work_day.destroy
    respond_to do |format|
      format.html { redirect_to controller: 'calenders', action: 'show', id: calender.id,
                                notice: 'Work day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_day
      @work_day = WorkDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_day_params
      params.require(:work_day).permit(:in_hour, :out_hour, :lunch)
    end
end
