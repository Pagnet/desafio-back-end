class FinancialEntriesController < ApplicationController
  before_action :set_financial_entry, only: [:show, :edit, :update, :destroy]

  # GET /financial_entries
  # GET /financial_entries.json
  def index
    @financial_entries = FinancialEntry.all
  end

  # GET /financial_entries/1
  # GET /financial_entries/1.json
  def show
  end

  # GET /financial_entries/new
  def new
    @financial_entry = FinancialEntry.new
  end

  # GET /financial_entries/1/edit
  def edit
  end

  # POST /financial_entries
  # POST /financial_entries.json
  def create
    @financial_entry = FinancialEntry.new(financial_entry_params)

    respond_to do |format|
      if @financial_entry.save
        format.html { redirect_to @financial_entry, notice: 'Financial entry was successfully created.' }
        format.json { render :show, status: :created, location: @financial_entry }
      else
        format.html { render :new }
        format.json { render json: @financial_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financial_entries/1
  # PATCH/PUT /financial_entries/1.json
  def update
    respond_to do |format|
      if @financial_entry.update(financial_entry_params)
        format.html { redirect_to @financial_entry, notice: 'Financial entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @financial_entry }
      else
        format.html { render :edit }
        format.json { render json: @financial_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_entries/1
  # DELETE /financial_entries/1.json
  def destroy
    @financial_entry.destroy
    respond_to do |format|
      format.html { redirect_to financial_entries_url, notice: 'Financial entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import_form
    render :import
  end

  def import
    Command::FinancialEntry::Import.new(file: entry_import_params[:file]).execute
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_entry
      @financial_entry = FinancialEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def financial_entry_params
      params.require(:financial_entry).permit(:kind, :transaction_date, :transaction_time, :amount, :social_number, :card_number, :store_id)
    end

    def entry_import_params
      params.require(:upload).permit(:file)
    end
end
