class BillsController < ApplicationController
  load_and_authorize_resource
  include InheritAction


  def purge_file
  	@resource = Bill.find(params[:id])
  	@resource.files.find_by_id(params[:attachment_id]).purge
  	
  	redirect_to bill_path(@resource)
  end

  private

  def resource_params
    params.require(:bill).permit(:number, :bill_date, :discription, :amount, :status, :paid_amount, :paid_from, :paid_via, :paid_notes, :gst_bill, :gst_uploaded, :vendor_id, files: [])
  end
end
