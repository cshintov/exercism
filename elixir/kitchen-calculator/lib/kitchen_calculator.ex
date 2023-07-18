defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({:cup, volume}), do: {:milliliter, volume * 240}
  def to_milliliter({:milliliter, volume}), do: {:milliliter, volume}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, volume * 30}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, volume * 5}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, volume * 15}

  def from_milliliter_helper(volume_pair, in_ml) do
    unit = volume_pair
      |> to_milliliter
      |> get_volume
      |> Kernel./ in_ml
  end

  def from_milliliter(volume_pair, :cup) do
    {:cup, from_milliliter_helper(volume_pair, 240)}
  end

  def from_milliliter(volume_pair, :milliliter) do
    {:milliliter, get_volume(volume_pair)}
  end

  def from_milliliter(volume_pair, :fluid_ounce) do
    {:fluid_ounce, from_milliliter_helper(volume_pair, 30)}
  end

  def from_milliliter(volume_pair, :teaspoon) do
    {:teaspoon, from_milliliter_helper(volume_pair, 5)}
  end

  def from_milliliter(volume_pair, :tablespoon) do
    {:tablespoon, from_milliliter_helper(volume_pair, 15)}
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
      |> from_milliliter unit
  end
end
