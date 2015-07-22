class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource| # IMPORT CODE FROM Devise::RegistrationsController
      if params[:plan] # When user submits either a basic or pro form, a plan should be submitted
        resource.plan_id = params[:plan] # Take value of plan and update resource table for user
        if resource.plan_id == 2 # If plan is a Pro plan
          resource.save_with_payment # Special method for pro users
        else
          resource.save # Save as normal
        end
      end
    end
  end
end