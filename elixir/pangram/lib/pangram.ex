defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @upper ?A..?Z
  @lower ?a..?z
  @diff_A_to_a 32

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    sentence
    |> String.to_charlist
    |> Enum.reduce(MapSet.new, &collect_alphabet/2)
    |> has_all_alphabet?
  end

  defp has_all_alphabet?(visited), do: Enum.count(visited) == 26

  defp collect_alphabet(x, visited) when x in @upper or x in @lower do
    MapSet.put(visited, to_lower(x))
  end

  defp collect_alphabet(_, visited), do: visited

  defp to_lower(n) when n < ?a, do: n + @diff_A_to_a
  defp to_lower(n), do: n
end
