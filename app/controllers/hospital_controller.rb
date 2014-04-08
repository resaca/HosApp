class HospitalController < ApplicationController
  def index
		if params.has_key?(:commit)
			if params["/hospital/index"][:user_type] == 'd'
				@doctor = Doctor.new(params["/hospital/index"].permit(:name, :department))
				@doctor.save
				render :json => @doctor
			elsif params["/hospital/index"][:user_type] == 'p'
				@patient = Patient.new(params["/hospital/index"].permit(:name, :age, :gender, :doctor_id))
				@doctor = Doctor.find(params["/hospital/index"][:doctor_id])
				@patient.save
				render :json => @patient
			end
		else
			@doctor = Doctor.new
			@patient = Patient.new
			@doctors = Doctor.paginate(:page => params[:doctors_page], :per_page => 10)
			@patients = Patient.joins(:doctor).select("patients.name, doctors.name as doctor_name").paginate(:page => params[:patients_page], :per_page => 10)
		end
  end

	def show
		@doctor = Doctor.find(params[:id])
		render layout: false
	end

	def pdf_patients
		@patients = Patient.joins(:doctor).select("patients.age, patients.gender, patients.name, doctors.name as doctor_name")
		html = render_to_string("pdf_patients.html.erb") 
  	pdf = WickedPdf.new.pdf_from_string(html)
		save_path = Rails.root.join('pdfs','patients.pdf')
		File.open(save_path, 'wb') do |file|
			file << pdf
		end

		send_data(pdf, 
    	:filename    => "pdfs/patients.pdf", 
    	:disposition => 'attachment') 

	end

	def pdf_doctor
		@doctor = Doctor.find(params[:id])
		html = render_to_string("pdf_doctor.html.erb") 
  	pdf = WickedPdf.new.pdf_from_string(html)
		save_path = Rails.root.join('pdfs/doctor/','#{@doctor.name}.pdf')
		File.open(save_path, 'wb') do |file|
			file << pdf
		end

		send_data(pdf, 
    	:filename    => "pdfs/doctor/#{@doctor.name}.pdf", 
    	:disposition => 'attachment') 

	end
end
