class BillsController < ApplicationController
  load_and_authorize_resource
  include InheritAction

  private

  def resource_params
    params.require(:bill).permit(:number, :bill_date, :discription, :amount, :status, :paid_amount, :paid_from, :paid_via, :paid_notes, :gst_bill, :gst_uploaded, :vendor_id, files: [])
  end
end
