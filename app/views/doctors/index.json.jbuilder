json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :name, :description, :dob, :gender, :phone, :address
  json.url doctor_url(doctor, format: :json)
end
