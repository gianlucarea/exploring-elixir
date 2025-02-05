defmodule FamilyTree do

  def family_tree()do
    mario = %{name: "Mario", status: :grand_parent, age: 90}
    luigi = %{name: "Luigi", status: :grand_parent, age: 89}
    peach = %{name: "Peach", status: :grand_parent, age: 82}
    idk =  %{name: "Idk", status: :grand_parent, age: 80}

    father = %{name: "Father", status: :parent, age: 55, parents: [mario, peach]}
    mother = %{mother: "Mother", status: :parent, age: 50, parents: [luigi,idk]}

    me = %{name: "Me", status: :son, age: 20, parents: [father, mother]}
    me
  end

end

FamilyTree.family_tree() |> IO.inspect()
