defmodule Mimex.Mixfile do
  use Mix.Project

  def project do
    [app: :mimex,
     version: "0.1.0",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     deps: deps,
     package: package,
     docs: docs]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.10", only: :dev}]
  end

  defp description do
    """
    MIME type utilities for Elixir.
    """
  end

  defp package do
    [maintainers: ["Laurens Duijvesteijn"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/hex-sh/mimex"}]
  end

  defp docs do
    [
      main: "extra-readme",
      extras: ["README.md", "CHANGELOG.md"]
    ]
  end
end
