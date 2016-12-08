class InvoiceHasProductsController < ApplicationController
  before_action :set_invoice_has_product, only: [:show, :edit, :update, :destroy]

  # GET /invoice_has_products
  # GET /invoice_has_products.json
  def index
    @invoice_has_products = InvoiceHasProduct.all
  end

  def userCreate
    @invoice_has_products = InvoiceHasProduct.all
  end

  def adminCreate
    @invoice_has_products = InvoiceHasProduct.all
  end

  # GET /invoice_has_products/1
  # GET /invoice_has_products/1.json
  def show
  end

  # GET /invoice_has_products/new
  def new
    @invoice_has_product = InvoiceHasProduct.new
  end

  # GET /invoice_has_products/1/edit
  def edit
  end

  # POST /invoice_has_products
  # POST /invoice_has_products.json
  def create
    @invoice_has_product = InvoiceHasProduct.new(invoice_has_product_params)

    respond_to do |format|
      if @invoice_has_product.save
        format.html { redirect_to "/sessions/new", notice: 'Invoice has product was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_has_product }
      else
        format.html { render :new }
        format.json { render json: @invoice_has_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_has_products/1
  # PATCH/PUT /invoice_has_products/1.json
  def update
    respond_to do |format|
      if @invoice_has_product.update(invoice_has_product_params)
        format.html { redirect_to @invoice_has_product, notice: 'Invoice has product was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_has_product }
      else
        format.html { render :edit }
        format.json { render json: @invoice_has_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_has_products/1
  # DELETE /invoice_has_products/1.json
  def destroy
    @invoice_has_product.destroy
    respond_to do |format|
      format.html { redirect_to invoice_has_products_url, notice: 'Invoice has product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_has_product
      @invoice_has_product = InvoiceHasProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_has_product_params
      params.require(:invoice_has_product).permit(:order_id, :product_id, :product_quantity)
    end
end
