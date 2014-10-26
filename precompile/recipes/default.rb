node[:deploy].each do |application, deploy|
  rails_env = deploy[:rails_env]
  current_path = deploy[:current_path]

  Chef::Log.info("Precompiling all assets for #{rails_env}")

  execute 'bundle exec rake assets:precompile' do
	cwd current_path
	user 'deploy'
	command 'bundle exec rake assets:precompile'
	environment 'RAILS_ENV' => rails_env
  end
end
