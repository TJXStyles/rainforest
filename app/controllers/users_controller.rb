class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to products_url, notice => "Signed Up!"
  	else
  		render "new"
  	end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])

       format.html { redirect_to @user, notice: 'User was successfully updated' }
        else
          format.html { render action: 'edit' }
      end
    end
  end
end
