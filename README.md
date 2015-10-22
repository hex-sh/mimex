# mimex

[![Build Status](https://api.travis-ci.org/hex-sh/mimex.svg?branch=master)](https://travis-ci.org/hex-sh/mimex)

MIME type utilities for Elixir. Get the MIME type for an extension or a list
of extensions for a MIME type. [Documentation is available here](http://hexdocs.pm/mimex).

## Usage

Add the following to your `mix.exs` file:

``` elixir
defp deps do
  [{"mimex", "~> 0.1.0}"]
end
```

Then run `mix deps.get`. You're now able to call the functions we provide. See
the section on functions for a brief reference.

## Functions

`mimex` provides the following functions:

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

It doesn't matter whether you call the above functions with upper or loewrcase
extensions. It also doesn't matter if the `.` is present or not. When you pass
in a MIME type, we always return a lowercase extension with a `.`.
