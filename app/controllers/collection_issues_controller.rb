class CollectionIssuesController < ApplicationController
  def index
    @collection = Collection.find(params[:id])
    @issues = @collection.issues
  end
end