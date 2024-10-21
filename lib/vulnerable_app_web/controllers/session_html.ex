defmodule VulnerableAppWeb.SessionHTML do
  use VulnerableAppWeb, :html

  # Import form helpers to use `form_for/3` and other helpers
  embed_templates "session_html/*"
end
