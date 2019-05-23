class EmailsController < ApplicationController
 require 'faker'

	def index
		@emails = Email.all
	end

	def create
		puts "$$" * 100
		puts params
		puts "$$" * 100
		@email2 = Email.create(objet: "#{Faker::Internet.email}", body: "#{Faker::Movie.quote}")
		@email = Email.create(objet: params[:objet], body: params[:body])
		
		
		respond_to do |format|
		format.html { redirect_to emails_path }
		format.js { }
		end
	end

	def show
		puts "$$" * 100
		puts params[:id]
		puts "$$" * 100

		@email_show_body = Email.find(params[:id]).body
		@email_show_objet = Email.find(params[:id]).objet
		@email_show_id = Email.find(params[:id]).id

		respond_to do |formats|
		formats.html { redirect_to root_path }
		formats.js { }
		end


	end

	private

	def email_params
	  params.permit(:objet, :body)
	end


end
