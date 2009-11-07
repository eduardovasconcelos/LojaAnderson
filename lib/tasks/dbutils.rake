namespace :db do
  namespace :utils do
    desc "Create a dump of the database"
    task :dump => :environment do
      config = load_config
      assert_adapter("mysql", config)
      formatted_time = ENV['DUMP_TIMESTAMP'] || Time.now.strftime("%Y%m%d%H%M")
      file_name = "dump_#{config['database']}_#{formatted_time}.sql.bz2"
      dump_dir = ENV['DUMP_DIR'] || "#{ENV['HOME']}/tmp"
      mkdir_p dump_dir
      cmd = "mysqldump -u #{config['username']} --password=#{config['password']} #{config['database']} | bzip2 -9c > #{File.join(dump_dir, file_name)}"

      puts "Starting #{cmd}"
      sh cmd
      puts "Done!"
    end

    desc "Import dump file created by db:utils:dump."
    task :import_dump => :environment do
      config = load_config
      assert_adapter("mysql", config)
      assert_file_on_environment("db:utils:import_dump", config)
      cmd = "bzcat #{ENV['FILE']} |  mysql -u #{config['username']} --password=#{config['password']} #{config['database']}"

      puts "Starting #{cmd}"
      sh cmd
      puts "Done!"
    end

    desc "Recreate the database and import dump file created by db:utils:dump."
    task :recreate_from_dump => :environment do
      config = load_config
      assert_adapter("mysql", config)
      assert_file_on_environment("db:utils:recreate_from_dump", config)
      [
        "db:drop",
        "db:create",
        "db:utils:import_dump",
      ].each do |task|
        puts "Invoking #{task}"
        Rake::Task[task].invoke
      end
    end
  end
end

def load_config
  ActiveRecord::Base.configurations[RAILS_ENV || 'development']
end

def assert_adapter(expected_adapter, config = load_config)
  current_adapter = config["adapter"] 
  unless current_adapter == expected_adapter
    raise "Task not supported by '#{current_adapter}'"
  end
end

def assert_file_on_environment(task, config = load_config)
  unless ENV['FILE']
    raise <<-WARNING
rake db:utils:import_dump OPTIONS

OPTIONS:
FILE=filedump *required
RAILS_ENV=development *optional defaults to development

You should tell the full file path that represents your dump.
Example: rake #{task} FILE=#{ENV['HOME']}/tmp/dump_#{config['database']}_200811201707.sql.bz2
    WARNING
  end
end