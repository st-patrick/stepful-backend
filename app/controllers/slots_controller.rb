class SlotsController < ApplicationController
  before_action :set_slot, only: %i[ show update destroy ]

  # GET /slots
  def index
    @slots = Slot.all

    render json: @slots
  end

  # GET /slots/1
  def show
    render json: @slot
  end

  # GET /slots/available
  def available
    render json: Slot.where(start_time: (Time.now)..)
                      .where(student_id: nil)
                      .left_outer_joins(:coach)
                      .to_json(include: :coach)  
  end

  # POST /slots
  def create
    @slot = Slot.new(slot_params)

    if @slot.save
      render json: @slot, status: :created, location: @slot
    else
      render json: @slot.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /slots/1
  def update
    if @slot.update(slot_params)
      render json: @slot
    else
      render json: @slot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /slots/1
  def destroy
    @slot.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slot
      @slot = Slot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def slot_params
      params.require(:slot).permit(:start_time, :coach_id, :student_id, :review_id)
    end
end
