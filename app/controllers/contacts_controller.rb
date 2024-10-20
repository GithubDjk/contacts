class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    page = params[:page] || 1
    per = params[:per] || 10
    @contacts = Contact.order(:name).page(page).per(per)
    @contacts = @contacts.where("name ILIKE ?", "%#{params[:search]}%") if params[:search].present?
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    p "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    p "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    p "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    p "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    p "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"

    @contact.destroy
    redirect_to contacts_path, notice: 'Contact was successfully destroyed.'
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone_number, :email)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
