namespace :db do
  desc "Display database configuration."
  task :config => [ :environment ] do
    puts YAML.load_file(Rails.root.join('config/database.yml'))["#{Rails.env}"].inspect
  end
end

