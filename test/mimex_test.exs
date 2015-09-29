defmodule MimexTest do
  use ExUnit.Case

  test "find a few common file types" do
    assert MIME.mime_type(".png") == {:ok, "image/png"}
    assert MIME.mime_type(".pdf") == {:ok, "application/pdf"}
    assert MIME.mime_type(".doc") == {:ok, "application/msword"}
  end

  test "handles duplicate extensions correctly" do
    assert MIME.mime_type(".jpg")  == {:ok, "image/jpeg"}
    assert MIME.mime_type(".jpeg") == {:ok, "image/jpeg"}
    assert MIME.mime_type(".jpe")  == {:ok, "image/jpeg"}
  end

  test "handles UPPERCASE extensions correctly" do
    assert MIME.mime_type(".JPEG") == {:ok, "image/jpeg"}
    assert MIME.mime_type(".DOC")  == {:ok, "application/msword"}
  end

  test "returns {:error, reason} when extension is undefined" do
    assert MIME.mime_type("asdfasdf") == {:error, "No extension matches"}
  end

  test "throwing version of mime_type" do
    assert MIME.mime_type!(".jpg") == "image/jpeg"
    assert_raise ArgumentError, "No extension matches", fn ->
      MIME.mime_type!("asdf")
    end
  end
end
