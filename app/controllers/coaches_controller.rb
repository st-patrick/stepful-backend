class CoachesController < ApplicationController
  before_action :set_coach, only: %i[ show update destroy ]

  # GET /coaches
  def index
    @coaches = Coach.all

    render json: @coaches
  end

  # GET /coaches/1
  def show
    render json: @coach
  end

  def showslots
    render json: Slot.where(coach_id: params[:id])
                    .where(start_time: (Time.now)..) 
                    .left_outer_joins(:student)
                    .order(:start_time)
                    .to_json(include: :student)
  end

  def showreviewed
    render json: Review.joins(:slot => :student)
                    .where(slot: {coach_id: params[:id]})
                    .where(slot: {start_time: ..(Time.now)})
                    .to_json(include: {slot: {include: :student}})                          
  end  

  # POST /coaches
  def create
    @coach = Coach.new(coach_params)

    if @coach.save
      render json: @coach, status: :created, location: @coach
    else
      render json: @coach.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /coaches/1
  def update
    if @coach.update(coach_params)
      render json: @coach
    else
      render json: @coach.errors, status: :unprocessable_entity
    end
  end

  # DELETE /coaches/1
  def destroy
    @coach.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coach
      @coach = Coach.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coach_params
      params.require(:coach).permit(:name)
    end
end
