class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :require_login, except: [:show, :index]
  # GET /users
  # GET /users.json
  def index
    @users = User.full.all
    
  end
 
  # GET /users/1
  # GET /users/1.json
  def show
     
  end
  
  def add
  #raise params.inspect
    @user=User.find(params[:id])
    if params[:data].to_i == 0 then
      @current_user.partners.create(:friend=>@user)
    else
      @task=Task.find(params[:task_id].to_i)
      @task.guests.create(:group=>@user)
    end      
    render action: 'show'    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

 def search

  @query = params[:search_pattern].to_s.strip!
  if @query.to_s != ''
    @users = User.where(["first_name LIKE ? OR last_name LIKE ? 
             OR second_name LIKE ? OR email LIKE ?", 
             "%" + @query + "%", "%" + @query + "%", "%" + @query + "%", "%" + @query + "%"])
   
  else
    @users = User.all
  end
  render action: 'add_user'
 end

  # POST /users
  # POST /users.json
  def create
  #raise params.inspect
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :second_name, :male, :birthday, :password, :email)
    end
end
