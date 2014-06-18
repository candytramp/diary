class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:show, :index]
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.ujoin.ordering.all

  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end
  
  def show_guests
    @task=Task.find(params[:id])
    @guest_list=@task.guests
    render action: 'guest_list'
  end

  # POST /tasks
  # POST /tasks.json
  def create

    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Задание успешно создано.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Задание успешно обновлено.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Задание успешно удалено.' }
      format.json { head :no_content }
    end
  end
  def addusr
    #raise params.inspect
    @user=User.find(params[:id])
    @task=Task.find(params[:task_id])
    @task.guests.create(:group=>@user)
    redirect_to show_guests_task_path(@task)
  end

  def search_usr

    @query = params[:search_pattern].to_s.strip
    if @query.to_s != ''
      @users = User.where(["first_name LIKE ? OR last_name LIKE ?
             OR second_name LIKE ? OR email LIKE ?",
                           "%" + @query + "%", "%" + @query + "%", "%" + @query + "%", "%" + @query + "%"])

    else
      @users = User.all
    end
    render action: 'addusr'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:user_id, :place_id, :priority, :date, :name)
    end
end
