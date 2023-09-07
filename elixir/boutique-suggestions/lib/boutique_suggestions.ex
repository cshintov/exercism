defmodule BoutiqueSuggestions do

  defp is_affordable?(top, bottom, options), do:
    top[:price] + bottom[:price] <=
      Keyword.get(options , :maximum_price, 100)

  def get_combinations(tops, bottoms, options \\ [maximum_price: 100]) do
    for %{item_name: top_item, base_color: top_color} = top <- tops,
        %{item_name: bottom_item, base_color: bottom_color} = bottom <- bottoms,
        is_affordable?(top, bottom, options),
        top_color != bottom_color 
    do
      {
        %{top | item_name: top_item},
        %{bottom | item_name: bottom_item}
      }
    end
  end
end
