class CustomFailure < Devise::FailureApp
  def redirect_url
    request.referrer
  end

  # Redirect to root_url
  def respond
    if http_auth?
      http_auth
    else
      store_location!
      flash[:alert] = i18n_message unless flash[:notice]
      redirect_to request.referrer
    end
  end
end