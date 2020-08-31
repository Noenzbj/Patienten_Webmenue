class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :destroy, :update]
  def show
   set_patient
  end
  

  def index
      @patients=Patient.all
  end

  def new
      @patient = Patient.new
  end

  def edit
   set_patient
  end
  

  def create
      @patient = Patient.new(params.require(:patient).permit(:first_name, :last_name, :station, :room))
      if @patient.save
        flash[:notice] = "Patient wurde angelegt"
        redirect_to @patient
      else
        render "new"
      end
  end

  def update 
    if @patient.update(params.require(:patient).permit(:first_name, :last_name, :station, :room))
      flash[:notice] = "Erfolgreich bearbeitet"
      redirect_to @patient
    else 
      render "edit" 
    end
  end

  def destroy
    if @patient.destroy
      redirect_to patients_path
      flash[:notice] = @patient.first_name + " " + @patient.last_name + " wurde gelöscht!"
    end
  end

  private
    
  def set_patient
    @patient = Patient.find(params[:id])
  end
end
