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
    assert MIME.mime_type("asdfasdf") == {:error, "No extension matches: asdfasdf"}
  end

  test "mime_type!/1" do
    assert MIME.mime_type!(".jpg") == "image/jpeg"
    assert_raise ArgumentError, "No extension matches: asdf", fn ->
      MIME.mime_type!("asdf")
    end
  end

  test "extensions/1" do
    assert MIME.extensions("image/jpeg") == {:ok, [".jpeg", ".jpg", ".jpe"]}
    assert MIME.extensions("sadfasdf/asdfasdf") == {:error, "No MIME type matches: sadfasdf/asdfasdf"}
  end

  test "extensions!/1" do
    assert MIME.extensions!("image/jpeg") == [".jpeg", ".jpg", ".jpe"]
    assert_raise ArgumentError, "No MIME type matches: sadfasdf/asdfasdf", fn ->
      MIME.extensions!("sadfasdf/asdfasdf")
    end
  end

  test "extension/1" do
    assert MIME.extension("image/jpeg") == {:ok, ".jpeg"}
    assert MIME.extension("asdfasdf/asdfasdf") == {:error, "No MIME type matches: asdfasdf/asdfasdf"}
  end

  test "extension!/1" do
    assert MIME.extension!("image/jpeg") == ".jpeg"
    assert_raise ArgumentError, "No MIME type matches: asdfasdf/asdfasdf", fn ->
      MIME.extension!("asdfasdf/asdfasdf")
    end
  end
end
