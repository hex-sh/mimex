defmodule MIME do
  @moduledoc File.read!("./README.md")

  # Read all the MIME types into a list of the following structure:
  # [["sample/mime-type", "ext1", "ext2"], [..]]
  types = File.read!("#{:code.priv_dir(:mimex)}/mime.types")
  |> String.strip
  |> String.split("\n")
  |> Enum.map(&(String.split(&1, " ")))

  Enum.each types, fn [mime_type | extensions] ->
    def extension(unquote(mime_type)) do
      # Return the first extension from the list, prepended by "."
      unquote({:ok, "." <> hd(extensions)})
    end

    def extensions(unquote(mime_type)) do
      # Return the list of extensions, all prepended by "."
      unquote(
        {:ok, Enum.map(extensions, fn ext -> ("." <> ext) end)}
      )
    end

    Enum.each extensions, fn extension ->
      # Support getting a MIME type for extensions with and without a dot.
      def mime_type(unquote(extension)) do
        unquote({:ok, mime_type})
      end
      def mime_type(unquote("." <> extension)) do
        unquote({:ok, mime_type})
      end
    end
  end

  @doc """
  Thowing version of `mime_type/1`.
  """
  def mime_type!(extension) do
    case mime_type(extension) do
      {:ok, mime_type} -> mime_type
      {:error, reason} -> raise ArgumentError, message: reason
    end
  end

  @doc """
  Get the MIME type for `extension`.

  Extensions can contain periods or UPPERCASE characters. We take care of the
  normalization. Returns {:ok, extension} on success, {:error, reason} on
  failure.
  """
  def mime_type(extension) do
    # Currently we are in the catch-all function. Since we want to support
    # checking extensions that are uppercase, we have a check here to see if
    # some characters of the extension are capitals. If they are, we can retry
    # with a lower case, otherwise, we have not found a match and return an
    # error.
    unless String.downcase(extension) == extension do
      extension
      |> String.downcase
      |> mime_type
    else
      {:error, "No extension matches: " <> extension}
    end
  end

  @doc """
  Return a list of extensions associated with `mime_type`.
  """
  def extensions(mime_type) do
    {:error, "No MIME type matches: " <> mime_type}
  end

  @doc """
  Throwing version of `extensions/1`
  """
  def extensions!(mime_type) do
    case extensions(mime_type) do
      {:ok, mime_type} -> mime_type
      {:error, reason} -> raise ArgumentError, message: reason
    end
  end

  @doc """
  Get the first extension for `mime_type`.
  """
  def extension(mime_type) do
    {:error, "No MIME type matches: " <> mime_type}
  end

  @doc """
  Throwing version of `extension/1`.
  """
  def extension!(mime_type) do
    case extension(mime_type) do
      {:ok, mime_type} -> mime_type
      {:error, reason} -> raise ArgumentError, message: reason
    end
  end
end

