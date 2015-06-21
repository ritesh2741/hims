json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :description, :dob, :gender, :phone, :address
  json.url patient_url(patient, format: :json)
end
