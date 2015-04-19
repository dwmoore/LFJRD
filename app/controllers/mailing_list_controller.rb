class MailingListController < ApplicationController
  def signup
    mc = MailchimpService.new( {double_optin: true, email: signup_params[:email]} )
    mc.subscribe
    flash[:success] = "Thank you for registering! Check your email to complete your subscription."
    render "thanks"
  end

  private

  def signup_params
    params.permit(:email)
  end
end
