defprotocol Math do
  def add(value1, value2)
  def subtract(value1, value2)
end

defimpl Math, for: Integer do
  def add(value1,value2), do: value1 + value2
  def subtract(value1,value2), do: value1 - value2
end

defimpl Math, for: List do
  def add(value1,value2), do: value1 ++ value2
  def subtract(value1,value2), do: value1 -- value2
end

defimpl Math, for: String do
  def add(value1,value2), do: value1 <> value2
  def subtract(value1,value2), do
    (String.split(value1,"") -- String.split(value2,"")) |> Enum.join()
   end
end
