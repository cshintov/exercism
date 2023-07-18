defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({:cup, volume}), do: {:milliliter, volume * 240}
  def to_milliliter({:milliliter, volume}), do: {:milliliter, volume}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, volume * 30}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, volume * 5}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, volume * 15}

  def from_milliliter({unit, volume}, :cup) when unit == :milliliter do
    {:cup, volume / 240}
  end

  def from_milliliter({unit, volume}, :milliliter) when unit == :milliliter do
    {:milliliter, volume}
  end

  def from_milliliter({unit, volume}, :fluid_ounce) when unit == :milliliter do
    {:fluid_ounce, volume / 30}
  end

  def from_milliliter({unit, volume}, :teaspoon) when unit == :milliliter do
    {:teaspoon, volume / 5}
  end

  def from_milliliter({unit, volume}, :tablespoon) when unit == :milliliter do
    {:tablespoon, volume / 15}
  end

  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter() |> from_milliliter(unit)
  end
end
