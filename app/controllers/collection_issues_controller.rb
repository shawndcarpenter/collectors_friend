class CollectionIssuesController < ApplicationController
  def index
    @collection = Collection.find(params[:collection_id])
    @issues = @collection.issues
  end

  def edit
    # binding.pry
    @collection = Collection.find(params[:collection_id])
    @issue = Issue.find(params[:id])
  end

  def new
  end

  def create
    # binding.pry
    @collection = Collection.find(params[:id])

    issue = @collection.issues.new(issue_params)
    if issue.save
      redirect_to collection_issues_path(@collection)
    end
  end

  def update
    @collection = Collection.find(params[:collection_id])
    @issue = Issue.find(params[:id])
    if @issue.update(issue_params)
      redirect_to collection_issues_path(@collection)
    end
  end

  def export_csv
    @collection = Collection.find(params[:collection_id])
    @issues = @collection.all

    respond_to do |format|
      format.csv { send_data @issues.to_csv, filename: "#{@collection.name}_issues_#{Date.today}.csv" }
    end

    redirect_to collection_issues_path(@collection)
  end

  private
  def issue_params
    params.require(:issue).permit(:collection_id, :collector_id, :condition, :date, :origin, :status, :price, :title)
  end
end