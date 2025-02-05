# Use Process.send/3 and self() to send the process for the Elixir cell below a :message message.
# Use receive to receive the message in the same cell.
send(self(), :message)
receive do
    :message -> IO.puts(:message)
end

# Use Process.send/3 and self() to send the process for the Elixir cell below a message with a value i.e. {:message, "value"}.
# Use receive to receive the message in the same cell and return the value.
send(self(), {:message, "value"})
receive do
    {:message,payload} -> IO.puts(payload)
end

# Use Process.spawn/2 to spawn a new process which adds two integers together.
Process.spawn(fn ->
  a = 5
  b = 7
  IO.puts(a + b)
end, [])

# Use Process.spawn/2 and Process.sleep/1 to spawn a process that sleeps for five seconds, then prints "Finished!".
Process.spawn(fn ->
  Process.sleep(5000)
  IO.puts("Finished!")
end, [])

# Use Process.spawn/2 and receive to spawn a process that receives a :message message. Use Process.send/3 to send the spawned process a :message message.
# The spawned process should print "received a message!".
pid = Process.spawn(fn ->
  receive do
      :message -> IO.puts("Message Recieved")
  end
end, [])
Process.send(pid,:message,[])

# Use Process.spawn/2 and receive to spawn a process that receives a message with a value i.e. {:message, "value"}.
# Use Process.send/3 to send the spawned process a message with a value. The spawned process should print the received value.
pid = Process.spawn(fn ->
  receive do
      {:message,value} -> IO.puts(value)
  end
end, [])

Process.send(pid,{:message,10},[])

# Use Process.spawn/2 to spawn a process that raises an error.
# Notice it does not crash the Livebook, because it is an unlinked process.
Process.spawn(fn ->
  raise "ooops"
end,[])

# Use Process.spawn/3 and Process.sleep/1 to spawn a process which raises an error after one second.
# Use Process.link/1 to link the process
pid1 = spawn_link(fn ->
  Process.sleep(1000)
  raise "ooops"
end)
send(pid1,:message)

# Use Process.spawn/2 and Process.sleep/1 to spawn a process that sleeps for five seconds.
# Use Process.alive?/1 and Process.sleep/1 to check if the process is alive after two seconds. Process.alive?/1 should return true.
pid = Process.spawn(fn ->
  Process.sleep(5000)
end, [])
Process.sleep(2000)
Process.alive?(pid)

# Use Process.spawn/2 and Process.sleep/1 to spawn a process that sleeps for five seconds.
# Use Process.alive?/1 and Process.sleep/1 to check if the process is alive after six seconds. Process.alive?/1 should return false.
pid = Process.spawn(fn ->
  Process.sleep(5000)
end, [])
Process.sleep(6000)
Process.alive?(pid)

# Use Process.send_after/4 and self() to send the process for the Elixir cell below a message after two seconds.
# Use receive in the same cell to receive the message.
Process.send_after(self(),:message,2000)
receive do
  :message -> IO.puts("Message after 2 Sec")
end

# Use Process.spawn/3 to and receive to spawn a process that waits to receive a message.
# Use Process.send_after/4 to send the spawned process a message after two seconds.
pid = spawn(fn ->
  receive do
    :message -> IO.puts("Message after 2 Sec")
  end
end)
Process.send_after(pid,:message,2000)

# Use Process.spawn/2 and Process.sleep/1 to spawn a process that sleeps for five seconds.
# Print "I started" before sleeping, and "I finished" after sleeping to prove if the process finishes sleeping or not.
# Use Process.exit/2 with the :normal exit reason to kill the spawned process.
# Once finished, switch the exit reason to :kill to demonstrate that the process is unlinked,
# because it does not crash the calling process.
pid = Process.spawn(fn ->
  IO.puts("I started")
  Process.sleep(5000)
  IO.puts("I finished")
  end,[])
Process.sleep(1000)
Process.exit(pid, :normal) # Process.exit(pid, :kill)
Process.sleep(1000)
Process.alive?(pid)

#Use Kernel.spawn_link/1 and Process.sleep/1 to spawn a linked process that sleeps for five seconds.
# Use Process.exit/2 with the :normal exit reason to kill the spawned process.
# Notice that the Livebook does not crash. Switch the exit reason to :kill and notice that the Livebook does crash.
pid = spawn_link(fn ->
  IO.puts("I started")
  Process.sleep(5000)
  IO.puts("I finished")
  end)

Process.sleep(1000)
Process.exit(pid, :normal)   # Process.exit(pid, :kill)
Process.sleep(1000)
Process.alive?(pid)
