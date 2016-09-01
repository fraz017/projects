ActiveAdmin.register Project do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :technologies, :is_active
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	form do |f|
		f.inputs 'Project' do
	    f.input :name
	    f.input :technologies
	    f.input :is_active, as: :radio
	    f.actions
	  end
  end

	controller do 
		skip_before_filter :authenticate_active_admin_user, only: :show
		def find_resource
      scoped_collection.friendly.find(params[:id])
    end
		def show
			render json: scoped_collection.friendly.find(params[:id])
		end

		# def edit
		# 	@project = Project.friendly.find(params[:id])
		# end

		# def update
		# 	@project = Project.friendly.find(params[:id])
		# 	p = params.require(:project).permit!
		# 	@project.update_attributes(p)
		# 	redirect_to admin_project_path(@project)
		# end

		# def destroy
		# 	@project = Project.friendly.find(params[:id])
		# 	@project.destroy
		# 	redirect_to "/admin/projects"
		# end
		
	end

end
