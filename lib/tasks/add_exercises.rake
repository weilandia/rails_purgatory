require 'csv'
namespace :purgatory do
  desc 'add exercises from ../purgatory'
  task add_exercises: :environment do
    CSV.foreach('data/exercises.csv', headers: true, header_converters: :symbol) do |row|
      record = Exercise.first_or_create(row.to_h)
      puts "#{record.class.to_s} - #{record.name} created."
    end
  end
end
