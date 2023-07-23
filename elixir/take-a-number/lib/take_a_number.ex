defmodule TakeANumber do
  def loop(count) do
    receive do
      {:report_state, sender} ->
        send(sender, count)
        loop(count)

      {:take_a_number, sender} ->
        new_count = count + 1
        send(sender, new_count)
        loop(new_count)

      :stop -> count

      _ -> loop(count)
    end
  end


  def start(), do: spawn(TakeANumber, :loop, [0])
end
