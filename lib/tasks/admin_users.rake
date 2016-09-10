namespace :admin_users do

	task create_default: :environment do
		AdminUser.create! email: 'admin@example.com', password: 'password', password_confirmation: 'password'
	end

end