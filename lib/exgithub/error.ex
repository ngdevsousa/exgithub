defmodule Exgithub.Error do
  @keys [:status, :reason]
  @enforce_keys @keys

  defstruct @keys

  def build(status, reason) do
    %__MODULE__{
      status: status,
      reason: reason
    }
  end

  def user_not_found, do: build(:not_found, "User not found")
  def internal_server_error, do: build(:internal_server_error, "Internal Server Error")
end
