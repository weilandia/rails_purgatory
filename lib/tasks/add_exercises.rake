require 'csv'
namespace :purgatory do
  desc 'add exercises from ../purgatory'
  task add_exercises: :environment do
    record = Exercise.find_or_create_by(name: "welcome to purgatory") do |e|
      e.spec = "",
      e.spec_path = "",
      e.solution_frame = "",
      e.solution_frame_path = ""
    end

    puts "#{record.class.to_s} - #{record.name} created."

    CSV.foreach('data/exercises.csv', headers: true, header_converters: :symbol) do |row|
      record = Exercise.find_or_create_by(name: row.to_h[:name]) do |e|
        e.spec = row.to_h[:spec],
        e.spec_path = row.to_h[:spec_path],
        e.solution_frame = row.to_h[:solution_frame],
        e.solution_frame_path = row.to_h[:solution_frame_path]
      end
      puts "#{record.class.to_s} - #{record.name} created."
    end
  end
end
