# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def destroy_table_instances
	Book.destroy_all
	Email.delete_all
end

def create_books
	5.times do 
  		Book.create(author: Faker::Book.author, title: Faker::Book.title)
	end
end

def create_emails
	
	10.times do
		Email.create(objet: Faker::Internet.email, body: Faker::Movie.quote, read: Faker::Boolean.boolean)
	end

end


def perform
	destroy_table_instances
	create_books
	create_emails
end

perform