RailsAdmin.config do |config|
  config.authorize_with do
  redirect_to main_app.root_path if !user_signed_in? || current_user.role != 'admin'
  end
config.current_user_method(&:current_user)
  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
