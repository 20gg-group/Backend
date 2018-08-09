module Admin::SessionsHelper
  def log_in(admin)
    session[:admin_id] = admin.id
  end
  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Admin.find_by(id: session[:admin_id])  #Lay session id cho nhung trang tiep theo
  end
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    current_user.present?  # True neu user login
  end
  # Logs out the current user.
  def log_out
    reset_session
    @current_user = nil
  end
end


