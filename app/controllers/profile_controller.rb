class ProfileController < ApplicationController
  skip_after_action :verify_policy_scoped
  def index
    if current_user.is_vet_owner?
      @vets = current_user.vets
    end
  end

end
