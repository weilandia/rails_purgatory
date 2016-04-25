require 'csv'
namespace :purgatory do
  desc 'add exercises from ../purgatory'
  task add_exercises: :environment do
    Exercise.find_or_create_by(name: "welcome to purgatory") do |e|
      e.spec = "tutorial",
      e.spec_path = "tutorial",
      e.solution_frame = "tutorial",
      e.solution_frame_path = "tutorial",
      e.level = 0
      puts "#{e.class.to_s} - #{e.name} created."
    end


    CSV.foreach('data/exercises.csv', headers: true, header_converters: :symbol) do |row|
      Exercise.find_or_create_by(name: row.to_h[:name]) do |e|
        e.spec_path = row.to_h[:spec_path]
        e.solution_frame = row.to_h[:solution_frame]
        e.solution_frame_path = row.to_h[:solution_frame_path]
        e.level = row.to_h[:level]
        e.spec = row.to_h[:spec]
        puts "#{e.class.to_s} - #{e.name} created."
      end
    end
  end
end
