load File.join(Rails.root, 'db', 'seeds', 'reference_data.rb')
at_exit do
  Classifier.destroy_all
end
