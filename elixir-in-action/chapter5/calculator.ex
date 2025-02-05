defmodule Calculator do
  def start do
    spawn(fn  -> lopp(0) end) #Create process
  end

  def value(server_pid) do
    send(server_pid, {:value, self()})
    receive do
      {:response, value} -> value
    end
  end

  def loop(current_value) do
    new_value = receive do
      {:value, caller} ->
        send(caller, {:respone, current_value})
        current_value

      {:add,value} -> current_value + value
      {:sub,value} -> current_value - value
      {:mul,value} -> current_value * value
      {:div,value} -> current_value / value

      invalid_request ->
        IO.puts("Invalid Req")
        current_value
    end

    loop(new_value)
  end
end
