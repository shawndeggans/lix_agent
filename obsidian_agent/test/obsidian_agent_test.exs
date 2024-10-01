defmodule ObsidianAgentTest do
  use ExUnit.Case
  doctest ObsidianAgent

  test "greets the world" do
    assert ObsidianAgent.hello() == :world
  end
end
