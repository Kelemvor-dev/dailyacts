class SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
before_filter :update_session_state, only: [:destroy]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
    super
    current_user.update_attribute(:state_session, true)   
   end

  # DELETE /resource/sign_out
   def destroy
     super    
   end

  protected

  def update_session_state
     current_user.update_attribute(:state_session, false) 
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
