class EmailsController < ApplicationController
 require 'faker'

	def index
		@emails = Email.all
	end

	def create
		puts "$$" * 100
		puts params
		puts "$$" * 100
		@email2 = Email.create(objet: "#{Faker::Internet.email}", body: "#{Faker::Movie.quote}", read: Faker::Boolean.boolean)
		@email = Email.create(objet: params[:objet], body: params[:body], read: Faker::Boolean.boolean)
		
		
		respond_to do |format|
		format.html { redirect_to emails_path }
		format.js { }
		end
	end

	def show
		puts "$$" * 100
		puts params[:id]
		puts "$$" * 100
		@email_one = Email.find(params[:id])
		@email_show_body = Email.find(params[:id]).body
		@email_show_objet = Email.find(params[:id]).objet
		@email_show_id = Email.find(params[:id]).id

		respond_to do |formats|
		formats.html { redirect_to root_path }
		formats.js { }
		end
	end


	def destroy

		@mail = Email.find(params[:id])
		@mail.destroy
		redirect_to root_path
		
	end


	def update
		@mail_read = Email.find(params[:id])
		if @mail_read.read == true
			@mail_read.update(read: false)
		else
			@mail_read.update(read: true)
		end
		
	end



	private

	def email_params
	  params.permit(:objet, :body)
	end


end
