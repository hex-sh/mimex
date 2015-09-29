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
end
