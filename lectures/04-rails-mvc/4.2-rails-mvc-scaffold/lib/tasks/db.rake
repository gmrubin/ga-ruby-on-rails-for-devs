namespace :db do
  desc "Display database configuration."
  task :config => [ :environment ] do
    config = YAML.load_file(File.join(Dir.pwd, '/config/database.yml'))
    puts config["#{Rails.env}"].inspect
  end
end

