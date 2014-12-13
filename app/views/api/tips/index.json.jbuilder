json.tips @tips do |tip|
  json.extract! tip,
    :name, :subject, :text, :email, :city, :state, :created_at
end
