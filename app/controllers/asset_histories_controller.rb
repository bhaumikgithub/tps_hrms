class AssetHistoriesController < ApplicationController
  load_and_authorize_resource
  include InheritAction
end
