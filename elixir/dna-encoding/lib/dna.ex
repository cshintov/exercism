defmodule DNA do
  @codes %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000,
  }
  @decodes Map.new(@codes, fn {k, v} -> {v, k} end)

  def encode_nucleotide(code_point), do: @codes[code_point]

  def decode_nucleotide(encoded_code), do: @decodes[encoded_code]

  def encode(dna), do: do_encode(dna, <<>>)

  defp do_encode(~C"", encoded), do: encoded
  defp do_encode([char | rest], encoded) do
    do_encode(rest, <<encoded::bitstring, encode_nucleotide(char)::size(4)>>)
  end

  def decode(dna), do: do_decode(dna, '')

  defp do_decode(<<>>, decoded), do: decoded
  defp do_decode(<<first::size(4), rest::bitstring>>, decoded) do
    do_decode(rest, decoded ++ [decode_nucleotide(first)])
  end
end
