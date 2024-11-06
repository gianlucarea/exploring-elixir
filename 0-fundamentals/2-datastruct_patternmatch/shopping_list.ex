defmodule Shopping_List do

  def add_to_shopping_list(list,items),do: list ++ items
  def remove_from_shopping_list(list,items),do: list -- items

  def try_shopping_list() do
    list = []
    list = add_to_shopping_list(list, ["grapes","walnuts","apples"])
    list = add_to_shopping_list(list, ["blueberries","chocolate","pizza"])
    list = remove_from_shopping_list(list, ["grapes","walnuts"])
    add_to_shopping_list(list, ["banana","banana","banana"])
  end

  def add_to_shopping_cart(cart,items), do: cart ++ items
  def remove_from_shopping_cart(cart,items), do: cart -- items

  def try_shopping_cart() do
    cart = []
    cart = add_to_shopping_cart(cart,[milk: 1, eggs: 12])
    cart = add_to_shopping_cart(cart,[butter: 2, candies: 10])
    cart = remove_from_shopping_cart(cart,[butter: 2])
    cart = remove_from_shopping_cart(cart,[candies: 10])
    add_to_shopping_cart(cart,[candies: 5])
  end
end

Shopping_List.try_shopping_list() |> IO.inspect()
Shopping_List.try_shopping_cart() |> IO.inspect()
