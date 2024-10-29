defmodule MadLib do

  def programmers_motto_concat(word1,word2,word3) do
    "A programmer is a " <> word1 <> " that turns " <> word2 <> " into " <> word3 <> "."
  end

  def programmers_motto_interpolation(word1,word2,word3) do
    "A programmer is a #{word1} that turns #{word2} into #{word3}."
  end
end

MadLib.programmers_motto_concat("person","coffee","code") |> IO.inspect()
MadLib.programmers_motto_interpolation("person","coffee","code") |> IO.inspect()
