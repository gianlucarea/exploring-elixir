defmodule Metric do
  def convert(from, to) do
    meters = to_meter(from)

    case to do
      :millimeter -> meters / 0.001
      :centimeter -> meters / 0.01
      :meter -> meters / 1.0
      :kilometer -> meters / 1000.0
    end
  end

  defp to_meter({unit, value}) do
    case unit do
      :millimeter -> value * 0.001
      :centimeter -> value * 0.01
      :meter -> value * 1.0
      :kilometer -> value * 1000.0
    end
  end
end
