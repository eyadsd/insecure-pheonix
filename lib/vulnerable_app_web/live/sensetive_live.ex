defmodule VulnerableAppWeb.SensitiveLive do
  use Phoenix.LiveView
  import Phoenix.HTML.Form

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("submit", %{"password" => password}, socket) do
    # Simulate a crash with the submitted password
    raise "LiveView crash with password: #{password}"
  end

  def render(assigns) do
    ~H"""
    <div class="container mt-5">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="card p-4 shadow-sm">
            <h2 class="text-center mb-4">Submit Sensitive Data</h2>
            <form phx-submit="submit" class="form-group">
              <label for="password">Password</label>
              <input class="form-control mb-3" name="password" type="password" placeholder="Enter your password" />
              <button class="btn btn-primary w-100" type="submit">Submit</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
