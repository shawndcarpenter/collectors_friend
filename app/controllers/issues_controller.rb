class IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      redirect_to @issue
    else
      render 'new'
    end
  end

  def export_csv
    @issues = Issue.all

    respond_to do |format|
      format.csv { send_data @issues.to_csv, filename: "issues_#{Date.today}.csv" }
    end

    # redirect_to collection_issues_path(@collection)
  end

  private

  def issue_params
    params.require(:issue).permit(:collection_id, :condition, :date, :origin, :status, :price)
  end
end
