defmodule Workerpool do
  use Application

  def start(_type, _args) do
    pool_config = [mfa: {Workerpool.Worker, :start_link, []}, size: 5]
    start_pool(pool_config)
  end

  def start_pool(pool_config) do
    Workerpool.Supervisor.start_link(pool_config)
  end

  def checkout do
    Workerpool.Server.checkout
  end

  def checkin(worker_pid) do
    Workerpool.Server.checkin(worker_pid)
  end

  def status do
    Workerpool.Server.status
  end
end
