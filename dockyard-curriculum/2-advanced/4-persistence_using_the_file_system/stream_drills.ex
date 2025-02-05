# Use Stream.map/2 to double elements in a range from 1..10,
# then use Enum.to_list/1 to convert the resulting stream into
# a list [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
Stream.map(1..10,fn int -> int * 2 end) |> Enum.to_list()

# Use Stream.map/2 and Enum.to_list/1 to sum a list of tuple pairs
# [{1, 1}, {2, 2}, {3, 3}] into [2, 4, 6].
list_of_tuples = [{1, 1}, {2, 2}, {3, 3}]
Stream.map(list_of_tuples, fn {x,y} -> x + y end) |> Enum.to_list()

# Use Stream.filter/2 and Enum.to_list/1 to filter even numbers
# from a range 1..10 to return [2, 4, 6, 8, 10].
Stream.filter(1..10, fn int -> rem(int, 2) == 0 end) |> Enum.to_list()

# Use Stream.filter/2 and Enum.to_list/1 to filter numbers
# greater than 5 from a range 1..10 to return [6, 7, 8, 9, 10].
Stream.filter(1..10, fn int -> int > 5 end) |> Enum.to_list()

# Use Stream.cycle/1 with Enum.take/2 to generate the list [1, 2, 3, 1, 2, 3, 1, 2, 3].
Stream.cycle(1..3) |> Enum.take(9)

# Use Stream.cycle/1 with Enum.take/2 to generate the list ["a", "b", "a", "b"]
Stream.cycle(["a","b"]) |> Enum.take(4)

# Use Stream.iterate/2 and Enum.take/2 to generate a list of numbers from 1 to 10.
Stream.iterate(1, fn int -> int + 1 end) |> Enum.take(10)

# Use Stream.iterate/2 and Enum.take/2 to generate a list of negative numbers from 0 to -10.
Stream.iterate(0, fn int -> int - 1 end) |> Enum.take(11)

# Use Stream.iterate/2 and Enum.take/2 to generate a list of 2 to increasing
#powers by multiplying the accumulator by two. i.e. $2^1$, $2^2$, $2^3$, $2^4$.
Stream.iterate(1, fn accumulator -> accumulator * 2 end) |> Enum.take(8)

# Use Stream.unfold/2 and Enum.take/2 to generate a list of 10 cubed numbers. i.e. $1^3, 2^3, 3^3$
Stream.unfold(1, fn int -> {int ** 3, int + 1} end) |> Enum.take(10) |> Enum.to_list()

# Use Stream.unfold/2 and Enum.take/2 to generate a list of 5 integers as strings. ["1", "2", "3", "4", "5"].
Stream.unfold(1, fn int -> {Integer.to_string(int),int + 1} end) |> Enum.take(5) |> Enum.to_list()

# Use Stream.unfold/2 and Enum.take/2 to generate a list of integers from 1 to 10 divided by 2.
Stream.unfold(1, fn int -> {div(int,2), int + 1} end) |> Enum.take() |> Enum.to_list()

# Use Stream.chunk_every/2 with Enum.to_list/1 to chunk [1, 1, 2, 2, 3, 3] into [[1, 1], [2, 2], [3, 3]]
Stream.chunk_every([1,1,2,2,3,3],2) |> Enum.to_list()

# Use Stream.chunk_every/2 to chunk [1, 1, 1, 2, 2, 2] into [[1, 1, 1], [2, 2, 2]]
Stream.chunk_every([1,1,1,2,2,2],3) |> Enum.to_list()

# Use Stream.chunk_every/2 to chunk [1, 2, 2, 1, 4, 4]
# into pairs, then use Stream.map/2 to sum the pairs together to make [3, 3, 8].
Stream.chunk_every([1, 2, 2, 1, 4, 4],2)  |> Stream.map(fn [a,b] -> a + b end) |> Enum.to_list()
