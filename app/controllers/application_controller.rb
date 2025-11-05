class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization
  before_action :configure_permitted_parameters, if: :devise_controller?

  # The original syntax with explicit parentheses and braces would be:
  # after_action(:verify_policy_scoped, { only: :index, unless: :skip_pundit? })
  # 
  # In Ruby, parentheses around method arguments and curly braces for hashes are optional. Remember also, that the curly braces {} of a hash that's used as an argument of a method call can be omitted in Ruby.
  # when the meaning is clear. Omitting them is a common style in Rails for readability and brevity.
  # So the more idiomatic form is written without parentheses and braces:
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # Another way to write it:
  # after_action(:verify_policy_scoped, { only: :index, unless: :skip_pundit? })
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def configure_permitted_parameters
     # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys:[:username, :first_name])

     # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name])
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || cocktails_path
  end

  private

  def skip_pundit?
    devise_controller ? || params[:controller] =~
    /(^(rails_)?admin)|(^pages$)/
  end
end
