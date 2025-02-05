defmodule Products do
  def all_items do
    for name <- ["computer", "phone", "tablet"], price <- 1..100 do
      %{name: name, price: price}
    end
  end

  def search(items, filters) do
    name = Keyword.get(filters, :name)
    min = Keyword.get(filters, :min)
    max = Keyword.get(filters, :max)

    for item <- items,
    !name || item.name == name,
    !max || item.price <= max,
    !min || min <= item.price
    do
      item
    end
  end
end

Products.all_items() |> IO.inspect()
