class ContactsController < ApplicationController
  def index
    @contacts = Contact.page(params[:page]).per(10) # 10 contacts per page
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: "Contact was successfully created."
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "Contact was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path, notice: "Contact was successfully deleted."
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone_number, :email)
  end
end
