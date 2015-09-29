# mimex [![Build Status]][build-link] [![Hex Version]][version-link] ![License]

MIME type utilities for Elixir.

## Installation

Add the following to your `mix.exs` file:

``` elixir
defp deps do
  [{"mimex", "~> 0.1.0}"]
end
```

## Usage

 1. Install the library by adding it to your `mix.exs`.
 2. Call the functions when you need it.
 3. There is no step three.

## API reference

`Mimex` provides the following functions:

 1. `MIME.mime_type/1` &mdash; get the MIME type from the file extension.
 2. `MIME.extension/1` &mdash; get the first extension for a MIME type.
 3. `MIME.extensions/1` &mdash; get the list of extensions for a MIME type.

The above functions return `{:ok, result}` on success and {:error, reason} on
error. We also provide throwing versions:

 1. `MIME.mime_type!/1`
 2. `MIME.extension!/1`
 3. `MIME.extensions!/1`

These either return the result on success or throw an `ArgumentError` with
`reason` as the message on failure.

When asking for the MIME type, it doesn't matter whether your extension is upper
or lowercase, or whether it has a "." or not. When asking for an extension, we
always return the lowercase variant with a period.

 [Build Status]:https://api.travis-ci.org/hex-sh/mimex.svg?branch=master
 [Hex Version]:https://img.shields.io/hexpm/v/mimex.svg?label=hex%20version
 [License]:https://img.shields.io/hexpm/l/mimex.svg
 [build-link]:https://travis-ci.org/hex-sh/mimex
 [version-link]:https://hex.pm/packages/mimex
