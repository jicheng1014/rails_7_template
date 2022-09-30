class TunnelsController < ApplicationController
  before_action :set_tunnel, only: %i[ show edit update destroy ]

  # GET /tunnels or /tunnels.json
  def index
    @tunnels = Tunnel.all
  end

  # GET /tunnels/1 or /tunnels/1.json
  def show
  end

  # GET /tunnels/new
  def new
    @tunnel = Tunnel.new
  end

  # GET /tunnels/1/edit
  def edit
  end

  # POST /tunnels or /tunnels.json
  def create
    @tunnel = Tunnel.new(tunnel_params)

    respond_to do |format|
      if @tunnel.save
        format.html { redirect_to tunnel_url(@tunnel), notice: "Tunnel was successfully created." }
        format.json { render :show, status: :created, location: @tunnel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tunnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tunnels/1 or /tunnels/1.json
  def update
    respond_to do |format|
      if @tunnel.update(tunnel_params)
        format.html { redirect_to tunnel_url(@tunnel), notice: "Tunnel was successfully updated." }
        format.json { render :show, status: :ok, location: @tunnel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tunnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tunnels/1 or /tunnels/1.json
  def destroy
    @tunnel.destroy

    respond_to do |format|
      format.html { redirect_to tunnels_url, notice: "Tunnel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tunnel
      @tunnel = Tunnel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tunnel_params
      params.require(:tunnel).permit(:user_id, :password_digest, :level, :latest_started_at, :latest_ended_at, :aasm_state)
    end
end
