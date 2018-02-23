defmodule WorkerIdTest do
  use ExUnit.Case, async: true

  alias Bigflake.WorkerId

  test "from integer" do
    assert WorkerId.from(10) == 10
  end

  test "from default interface" do
    assert WorkerId.from(:default_interface) == 108_288_561_948_617
  end

  test "from with a specific interface en0" do
    assert WorkerId.from(:en1) == 191_357_987_494_657
  end

  test "from with invalid input" do
    assert_raise ArgumentError,
                 "expected an integer or an atom representing a network interface",
                 fn -> WorkerId.from("en0") end
  end
end
