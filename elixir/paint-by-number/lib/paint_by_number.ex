defmodule PaintByNumber do

  def palette_bit_size(color_count), do: helper(1, color_count)

  defp helper(n, color_count) do
    case color_count <= Integer.pow(2, n) do
      true -> n
      false -> helper(n + 1, color_count)
    end
  end

  def empty_picture(), do: <<>>

  defp simple_picture(1, s), do: <<0::size(s)>>
  defp simple_picture(2, s), do: <<0::size(s), 1::size(s)>>
  defp simple_picture(n, s), do: <<simple_picture(n-1, s)::bitstring, n-1::size(s)>>

  def test_picture(), do: simple_picture(4, 2)

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _color_count), do: nil
  def get_first_pixel(picture, color_count) do
    s = palette_bit_size(color_count)
    <<first::size(s), _::bitstring>> = picture
    first
  end

  def drop_first_pixel(<<>>, _color_count), do: <<>>
  def drop_first_pixel(picture, color_count) do
    s = palette_bit_size(color_count)
    <<_::size(s), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
