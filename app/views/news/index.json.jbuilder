json.array!(@news) do |news|
  json.extract! news, :id, :title, :description, :date, :products
  json.url news_url(news, format: :json)
end
