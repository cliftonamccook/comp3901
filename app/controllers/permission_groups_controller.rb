class PermissionGroupsController < ApplicationController
  before_action :set_permission_group, only: %i[ show edit update destroy ]

  def index
    @permission_groups = PermissionGroup.all
  end

  def show
  end

  def new
    @permission_group = PermissionGroup.new
  end

  def edit
  end

  def create
    @permission_group = PermissionGroup.new(permission_group_params)

    respond_to do |format|
      if @permission_group.save
        format.html { redirect_to permission_group_url(@permission_group), notice: "Permission group was successfully created." }
        format.json { render :show, status: :created, location: @permission_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @permission_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @permission_group.update(permission_group_params)
        format.html { redirect_to permission_group_url(@permission_group), notice: "Permission group was successfully updated." }
        format.json { render :show, status: :ok, location: @permission_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @permission_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @permission_group.destroy

    respond_to do |format|
      format.html { redirect_to permission_groups_url, notice: "Permission group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_permission_group
      @permission_group = PermissionGroup.find(params[:id])
    end

    def permission_group_params
      params.require(:permission_group).permit(:name, permissions_attributes: Permission.attribute_names.map(&:to_sym).append(:_destroy))
    end
end
