class CredentialsController < ApplicationController
  load_and_authorize_resource
  include InheritAction

  def index
  	@resources = Credential.all.order('created_at DESC')
  end
end
