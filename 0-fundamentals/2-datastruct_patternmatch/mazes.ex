defmodule Mazes do

  def solve_first_maze() do
    maze = %{
      south: %{
        west: %{
          south: %{
            east: %{
              south: %{
                east: %{
                  south: "Exit!"
                }
              }
            }
          }
        }
      }
    }

    maze.south.west.south.east.south.east.south
  end

  def solve_second_maze() do
    maze = %{
      "south" => %{
        "east" => %{
          "south" => %{
            "west" => %{
              "south" => %{
                "west" => %{
                  "south" => %{
                    "east" => %{
                      "south" => "Exit!"
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    maze["south"]["east"]["south"]["west"]["south"]["west"]["south"]["east"]["south"]
  end

  def solve_treasure_map() do
    treasure_map = %{
      "south ten paces" => %{
        10 => %{
          :"east three paces" => %{
            [1, 2, 3] => %{
              {"turn", "right"} => %{
                :dig => "gold"
              }
            }
          }
        }
      }
    }
    treasure_map["south ten paces"][10][:"east three paces"][[1,2,3]][{"turn", "right"}][:dig]
  end

  def update_treaure_map() do
    treasure_map = %{
      "south ten paces" => %{
        10 => %{
          :"east three paces" => %{
            [1, 2, 3] => %{
              {"turn", "right"} => %{
                :dig => "gold"
              }
            }
          }
        }
      }
    }

    treasure_map = %{treasure_map |
      "south ten paces" => %{
        10 => %{
          :"east three paces" => %{
            [1, 2, 3] => %{
              {"turn", "right"} => %{
                :dig => "taken"
              }
            }
          }
        }
      }
    }

    treasure_map
  end
end

Mazes.solve_first_maze |> IO.inspect()
Mazes.solve_second_maze |> IO.inspect()
Mazes.solve_treasure_map |> IO.inspect()
Mazes.update_treaure_map |> IO.inspect()
