defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  http://www.novaroma.org/via_romana/numbers.html
  """
  @base %{
    1 => "I",
    5 => "V",
    10 => "X",
    50 => "L",
    100 => "C",
    500 => "D",
    1000 => "M",
  }
  @basenums Map.keys(@base)

  @spec numeral(pos_integer) :: String.t()

  def numeral(n) when n in @basenums, do: @base[n]
  def numeral(n) do
    digs = digits(n)
    numeral(digs, length(digs))
  end

  defp numeral([], _), do: ""
  defp numeral([d], 1), do: single(d, 1)
  defp numeral([d | r], c), do: single(d, c) <> numeral(r, c-1)

  defp pow10(i), do: round(:math.pow(10, i))








  # The conversion of a single digit to corresponding Roman, taken care of by
  # single func.

  # Base cases
  defp single(0, _), do: ""     # This takes care of numbers like 101
  defp single(1, 1), do: "I"

  # When it's in the base map
  defp single(n, c) when n in @basenums, do:
    @base[n * pow10(c-1)]

  # For 2 and 3
  defp single(n, c) when n < 4, do:
    power10s_in_roman(c) <> single(n-1, c)

  # For 6, 7, 8
  defp single(n, c) when n > 4 and n < 9, do:
    halfs_in_roman(c) <> single(n-5, c)
  #     V                    II

  # For 4s, note the similarity to the case below of 9
  defp single(n, c) when n == 4, do:
    power10s_in_roman(c) <> halfs_in_roman(c)
  #       I                      V

  # When it's 9s
  # It's always <10^i> <10^i+1> for i = 0, 1, 2
  defp single(n, c) when n == 9, do:
    power10s_in_roman(c) <> power10s_in_roman(c+1)
  #           I                   X













  # Helper funcs

  # Either I, X, C -> 1, 10, 100
  defp power10s_in_roman(c), do: @base[pow10(c-1)]

  # V, L, D -> 5, 50, 500
  defp halfs_in_roman(c), do: @base[5 * pow10(c-1)]

  defp digits(n) when n >= 0 do
    Integer.to_string(n)
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end
end
