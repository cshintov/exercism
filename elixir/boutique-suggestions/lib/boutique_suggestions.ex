defmodule BoutiqueSuggestions do
  defp affordable?(top, bottom, options), do:
    top.price + bottom.price <=
      Keyword.get(options , :maximum_price, 100)

  def get_combinations(tops, bottoms, options \\ [maximum_price: 100]) do
    for top <- tops,
        bottom <- bottoms,
        affordable?(top, bottom, options),
        top.base_color != bottom.base_color
    do
      {top, bottom}
    end
  end
end
