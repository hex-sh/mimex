# mimex

**Pre-alpha software.** MIME type parser for Elixir.

## Installation

Add the following to your `mix.exs` file:

``` elixir
defp deps do
  [{"mimex, "~> x.x.x}]
end
```

## Usage

`Mimex` provides the following functions:

 1. `from_file/1` &mdash; get the MIME type from the file binary.
 2. `from_ext/1` &mdash; get the MIME type from the file extension.
 3. `to_ext/1` &mdash; get the file extension from the MIME type.
