json.array!(@work_days) do |work_day|
  json.extract! work_day, :id, :in_hour, :out_hour, :weekend
  json.url work_day_url(work_day, format: :json)
end
