defmodule MIME do
  types = File.read!("#{:code.priv_dir(:mimex)}/mime.types")
  |> String.strip
  |> String.split("\n")
  |> Enum.map(&(String.split(&1, " ")))

  Enum.each types, fn [mimetype | extensions] ->
    # We only support finding the first extension for a MIME type.
    def extension(unquote(mimetype)), do: unquote("." <> hd(extensions))
    Enum.each extensions, fn extension ->
      def type(unquote("." <> extension)), do: unquote(mimetype)
    end
  end
end

