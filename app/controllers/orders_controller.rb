class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /orders or /orders.json
  def index
    orders = current_user.orders
    orders = orders.joins(:inventory).where(:inventory => {:product_id => params['product_id_filter']}) if params['product_id_filter'].present?
    orders = orders.joins(:inventory).where(:inventory => {:sku => params['sku_filter']}) if params['sku_filter'].present?

    @orders = orders.paginate(page: params[:page], per_page: 10).order(:name)

    @avg_order_total = orders.map {|order| order.total.amount}.inject(&:+)
    @avg_order_total = 0 if @avg_order_total.blank?
    @avg_order_total = @avg_order_total / orders.size unless @avg_order_total == 0

    @total_order_count = orders.size

    @paid_count = orders.where(:order_status => 'Paid').size
    @open_count = orders.where(:order_status => 'Open').size
    @shipped_count = orders.where(:order_status => 'Shipped').size
    @fulfilled_count = orders.where(:order_status => 'Fulfulled').size
    @pending_count = orders.where(:order_status => 'Pending').size
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:product_id, :street_address, :apartment, :city, :state, :country_code, :zip, :phone_number, :email, :name, :order_status, :payment_ref, :transaction_id, :payment_amt_cents, :ship_charged_cents, :ship_cost_cents, :subtotal_cents, :total_cents, :shipper_name, :payment_date, :shipped_date, :tracking_number, :tax_total_cents)
    end
end
