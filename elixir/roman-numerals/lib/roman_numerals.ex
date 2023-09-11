defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  http://www.novaroma.org/via_romana/numbers.html
  """

  @roman_digits %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M",
  }

  # [1000, 900, ..., 1]
  @sorted_arabic_numbers Map.keys(@roman_digits) |> Enum.sort(:desc)

  @spec numeral(pos_integer) :: String.t()
  def numeral(n) when n > 0, do: encode(n)

  defp encode(n, arabic_numbers \\ @sorted_arabic_numbers)

  defp encode(n, [b | _] = arabic_numbers) when n > b, do:
    numeral(b) <> encode(n - b, arabic_numbers)

  defp encode(b, [b | _]), do: @roman_digits[b]

  defp encode(n, [_ | r]), do: encode(n, r)

end
