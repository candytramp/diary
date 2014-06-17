class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:show, :index]
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    
    @contact = Contact.new
    @user=User.find(params['user_id'])
    #@user.contact_lists.new(:friend=>@contact)
    
  end

  # GET /contacts/1/edit
  def edit
    @user = User.find(params[:user_id].to_i)
  end

  # POST /contacts
  # POST /contacts.json
  def create
    #raise params['contact']['task_id'].inspect
    @contact = Contact.new(contact_params)
    @user = User.find(params[:user_id])
   
    if params['contact']['task_id']  
      @task=Task.find(params['contact']['task_id'].to_i)
      @task.guests.create(:group=>@contact)
      url=show_guests_task_path(@task)
    else
      @user.partners.create!(:friend=>@contact)
      url=contact_lists_path
    end  
    
    respond_to do |format|
      if @contact.save
        format.html { redirect_to url, notice: 'Контакт был успешно создан.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    @user = User.find(params[:user_id].to_i)
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contact_lists_path, notice: 'Контакт был успешно обновлен.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to user_contacts_url, notice: 'Контакт был успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :second_name, :email, :male, :phone)
    end
end
