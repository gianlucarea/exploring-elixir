defmodule StackTest do
  use ExUnit.Case, async: true
  doctest Stack

  setup do
    {:ok, pid} = Stack.start_link()
    {:ok, pid: pid}
  end

  test "pop/2 - remove multiple elements from stack", %{pid: pid} do
    Stack.push(pid, 1)
    Stack.push(pid, 2)
    Stack.push(pid, 3)

    assert Stack.pop(pid, 2) == {:ok, [3, 2]}
    assert Stack.pop(pid, 2) == {:ok, [1]}
    assert Stack.pop(pid, 1) == {:error, :empty_stack}
  end

  test "pop/2 - remove elements from empty stack", %{pid: pid} do
    assert Stack.pop(pid, 3) == {:error, :empty_stack}
  end

  test "pop/2 - invalid count", %{pid: pid} do
    assert Stack.pop(pid, 0) == {:error, :invalid_count}
    assert Stack.pop(pid, -1) == {:error, :invalid_count}
  end
end
