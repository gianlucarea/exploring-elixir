defmodule TrafficLightsTest do
  use ExUnit.Case
  doctest TrafficLights.Light
  doctest TrafficLights.Grid


  setup do
    {:ok, pid} = TrafficLights.Light.start_link()
    {:ok, pid: pid}
  end

  test "current_light/1 - check current light", %{pid: pid} do
    assert TrafficLights.Light.current_light(pid) == :green
  end

  test "transition/1 - check after each transition" ,%{pid: pid} do
    TrafficLights.Light.transition(pid)
    assert TrafficLights.Light.current_light(pid) == :yellow
    TrafficLights.Light.transition(pid)
    assert TrafficLights.Light.current_light(pid) == :red
    TrafficLights.Light.transition(pid)
    assert TrafficLights.Light.current_light(pid) == :green
  end
end

defmodule TrafficLights.GridTest do
  use ExUnit.Case
  alias TrafficLights.Grid

  setup do
    # Start a new Grid process before each test
    {:ok, pid} = Grid.start_link()
    %{pid: pid}
  end

  test "initial state of all lights", %{pid: pid} do
    lights = Grid.current_light(pid)
    assert length(lights) == 5
    assert Enum.all?(lights, &(&1 == :green))
  end

  test "transitioning a single light", %{pid: pid} do
    Grid.transition(pid)
    lights_after_transition = Grid.current_light(pid)
    assert lights_after_transition == [:yellow, :green, :green, :green, :green]
  end

  test "transition index resets correctly", %{pid: pid} do
    1..5 |> Enum.each(fn _ -> Grid.transition(pid) end)
    Grid.transition(pid)
    final_lights = Grid.current_light(pid)
    assert final_lights == [:red, :yellow, :yellow, :yellow, :yellow]
  end
end
