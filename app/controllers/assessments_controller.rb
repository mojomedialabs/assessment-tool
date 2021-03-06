class AssessmentsController < ApplicationController
  before_filter :ensure_login

  def index
    @assessments = Assessment.all
  end

  def show
    @assessment = Assessment.find_by_slug(params[:id])

    if @assessment.nil?
      flash[:type] = "error"

      flash[:notice] = t "flash.assessment.error.could_not_find"

      redirect_to assessments_url and return
    end
  end

  def update_response
    #this just assumes js request format. probably not the best idea. but this really should never be accessed any other way
    answer = Answer.find(params[:answer_id])

    if !answer.nil?
      if @current_user.update_response(answer)
        render :text => t("flash.assessment.error.response_updated"), :status => 200
      else
        render :text => t("flash.assessment.error.could_not_update_response"), :status => 500
      end
    else
      render :text => t("flash.assessment.error.question_not_found"), :status => 404
    end
  end

  def results
    @assessment = Assessment.find_by_slug(params[:id])

    if @assessment.nil?
      flash[:type] = "error"

      flash[:notice] = t "flash.assessment.error.could_not_find"

      redirect_to assessments_url and return
    end

    if !@assessment.complete?(@current_user)
      flash[:type] = "error"

      flash[:notice] = t "flash.assessment.error.not_completed"

      redirect_to @assessment
    end
  end

  def summary
    @assessments = Assessment.order("display_order asc").delete_if { |assessment| !assessment.complete?(@current_user) }

    if @assessments.length == 0
      flash[:type] = "error"

      flash[:notice] = t "flash.assessment.error.summary_unavailable"

      redirect_to assessments_url and return
    end
  end
end