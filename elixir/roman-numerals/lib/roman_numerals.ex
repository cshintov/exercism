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

  defp digits(n) when n >= 0 do
    Integer.to_string(n)
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end

  @spec numeral(pos_integer) :: String.t()

  def numeral(n) when n in @basenums, do: @base[n]
  def numeral(n) do
    digs = digits(n)
    numeral(digs, length(digs))
  end

  defp numeral([], _), do: ""
  defp numeral([d], 1), do: ones(d, 1)
  defp numeral([d | r], c), do: ones(d, c) <> numeral(r, c-1)

  defp pow10(i), do: round(:math.pow(10, i))

  defp ones(0, _), do: ""
  defp ones(1, 1), do: "I"

  defp ones(n, c) when n < 4, do:
    @base[pow10(c-1)] <> ones(n-1, c)

  defp ones(n, c) when n in @basenums, do:
    @base[n * pow10(c-1)]

  defp ones(n, c) when n == 4, do:
    @base[pow10(c-1)] <> @base[5 * pow10(c-1)]

  defp ones(n, c) when n > 4 and n < 9, do:
    @base[5 * pow10(c-1)] <> ones(n-5, c)

  defp ones(n, c) when n == 9, do:
    @base[pow10(c-1)] <> @base[10 * pow10(c-1)]
end
