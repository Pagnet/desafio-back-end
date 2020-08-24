class FinancialEntriesController < ApplicationController
  # DELETE /financial_entries/1
  # DELETE /financial_entries/1.json
  def destroy
    deleted_record = Command::FinancialEntry::Destroy.new(id: params[:id]).execute

    respond_to do |format|
      format.html { redirect_to edit_store_path(deleted_record.store_id), notice: 'Financial entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /financial_entries/import
  def import_form
    render :import
  end

  # POST /financial_entries/import
  def import
    count = Command::FinancialEntry::Import.new(file: entry_import_params[:file]).execute

    respond_to do |format|
      format.html { redirect_to import_financial_entries_path, notice: "#{count} financial entries successfully imported." }
      format.json { head :ok }
    end
  end

  private
    def entry_import_params
      params.require(:upload).permit(:file)
    end
end
