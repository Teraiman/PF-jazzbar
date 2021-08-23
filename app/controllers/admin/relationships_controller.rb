class Admin::RelationshipsController < ApplicationController
  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    redirect_to request.referer
  end
end
