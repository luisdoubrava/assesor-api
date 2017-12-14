Rails.application.config.to_prepare do
  Devise::OmniauthCallbacksController.class_eval do
    def failure
      set_flash_message! :alert, :failure, kind: OmniAuth::Utils.camelize(failed_strategy.name), reason: failure_message
      redirect_to after_omniauth_failure_path_for(resource_name)
    end

    def assign_provider_attrs(user, auth_hash)
      all_attrs = auth_hash['info'].slice(*user.attributes.keys)
      orig_val = ActionController::Parameters.permit_all_parameters
      ActionController::Parameters.permit_all_parameters = true
      permitted_attrs = ActionController::Parameters.new(all_attrs)
      permitted_attrs.permit({})
      return_val = user.assign_attributes(permitted_attrs)
      ActionController::Parameters.permit_all_parameters = orig_val
      return return_val
    end
  end
end
