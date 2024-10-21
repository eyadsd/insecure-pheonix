defmodule VulnerableAppWeb.LiveHTML do
  use VulnerableAppWeb, :html

  # Import form helpers to use `form_for/3` and other helpers
  embed_templates "live_html/*"
end
