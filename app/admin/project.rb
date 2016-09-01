ActiveAdmin.register Project do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :technologies, :is_active, :slug
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	controller do 
		skip_before_filter :authenticate_active_admin_user, only: :show

		def show
			@project = Project.friendly.find(params[:id])
			render json: @project
		end

		def edit
			@project = Project.friendly.find(params[:id])
		end

		def destroy
			@project = Project.friendly.find(params[:id])
		end
	end

end
