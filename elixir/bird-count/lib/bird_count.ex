defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: Kernel.hd(list)

  def increment_day_count([]), do: [1]
  def increment_day_count([tdy | rest]), do: [tdy + 1 | rest]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([tdy | rest]) do
    cond do
      tdy == 0 -> true
      true -> has_day_without_birds?(rest)
    end
  end

  def total([]), do: 0
  def total([tdy | rest]), do: tdy + total(rest)

  def busy_days([]), do: 0
  def busy_days([tdy | rest]) do
    cond do
      tdy >= 5 -> 1 + busy_days(rest)
      true -> busy_days(rest)
    end
  end
end
