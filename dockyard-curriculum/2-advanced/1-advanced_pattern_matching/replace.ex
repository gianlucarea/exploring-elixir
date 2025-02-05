defmodule Replace do
  @doc """
  iex> Replace.nils([1, 2, 3, nil, 5], ["1", "2", "3", "4", "5"])
  [1, 2, 3, "4", 5]

  iex> Replace.nils([nil, nil, nil, nil, "5"], [1, 2, 3, 4, 5])
  [1, 2, 3, 4, "5"]
  """
  def nils(list1, list2) do
    Enum.zip(list1,list2)
    |> Enum.map(fn
      {nil,value} -> value
        {value,_} -> value
    end)
  end
end
