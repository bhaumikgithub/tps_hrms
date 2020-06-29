class AssetsController < ApplicationController
  load_and_authorize_resource
  include InheritAction
end
