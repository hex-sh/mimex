#!/usr/local/bin/elixir

defmodule Mimex.Fetch do
  def types do
    :ssl.start
    :inets.start

    {:ok, {_, _, file}} = :httpc.request('https://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/conf/mime.types')

    file
    |> to_string
    |> String.split("\n")
    |> Enum.filter_map(&is_comment?/1, &format/1)
    |> shorten
  end

  defp is_comment?(line) do
    not(String.starts_with?(line, "#"))
  end

  defp format(line) do
    line = String.split(line, "\t")
    "#{hd(line)} #{List.last(line)}\n"
  end

  defp shorten(list, amount \\ 1)
  defp shorten(list, amount) do
    shorten(list, amount, length(list))
  end

  defp shorten(_, amount, len) when len < amount, do: nil
  defp shorten(list, amount, len) do
    Enum.take(list, len - amount)
  end
end

{:ok, file} = File.open "priv/mime.types", [:write]

IO.binwrite(file, Mimex.Fetch.types)
File.close file
