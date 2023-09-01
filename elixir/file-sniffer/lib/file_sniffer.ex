defmodule FileSniffer do
  @file_types %{
    "exe" => %{
      file_type: "ELF",
      media_type: "application/octet-stream",
      signature: <<0x7F, 0x45, 0x4C, 0x46>>
    },
    "bmp" => %{
      file_type: "BMP",
      media_type: "image/bmp",
      signature: <<0x42, 0x4D>>
    },
    "png" => %{
      file_type: "PNG",
      media_type: "image/png",
      signature: <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>>
    },
    "jpg" => %{
      file_type: "JPG",
      media_type: "image/jpg",
      signature: <<0xFF, 0xD8, 0xFF>>
    },
    "gif" => %{
      file_type: "GIF",
      media_type: "image/gif",
      signature: <<0x47, 0x49, 0x46>>
    }
  }

  def type_from_extension(extension), do: @file_types[extension][:media_type]

  @doc """
    Get media type from content of the file
  """
  def type_from_binary(<<0x42, 0x4D, _::binary>>), do:
    type_from_extension("bmp")

  def type_from_binary(<<0x47, 0x49, 0x46, _::binary>>), do:
    type_from_extension("gif")

  def type_from_binary(<<0xFF, 0xD8, 0xFF, _::binary>>), do:
    type_from_extension("jpg")

  def type_from_binary(<<0x7F, 0x45, 0x4C, 0x46, _::binary>>), do:
    type_from_extension("exe")

  def type_from_binary(
    <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary>>), do:
    type_from_extension("png")

  def type_from_binary(_), do: nil


  @doc """
    Verify that binary and extension matches
  """
  def verify(file_binary, extension), do:
    do_verify(type_from_extension(extension), type_from_binary(file_binary))

  @warning "Warning, file format and file extension do not match."

  defp do_verify(nil, _), do: {:error, @warning}

  defp do_verify(filetype, filetype), do: {:ok, filetype}

  defp do_verify(_, _), do: {:error, @warning}
end
