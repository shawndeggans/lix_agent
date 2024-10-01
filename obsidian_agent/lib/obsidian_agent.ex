defmodule ObsidianAgent do
  use HTTPoison.Base

  # ... (previous code remains the same)

  defp generate_report(summaries) do
    report = """
    # Weekly Summary

    ## File Summaries
    #{Enum.map_join(summaries, "\n\n", &format_summary/1)}

    ## To-Do Items
    #{Enum.map_join(summaries, "\n", &format_todos/1)}
    """
    {:ok, report}
  end

  defp format_summary(%{file: file, summary: summary}) do
    """
    ### [[#{file}]]
    #{summary}
    """
  end

  defp format_todos(%{file: file, todos: todos}) do
    Enum.map_join(todos, "\n", fn todo -> "- [ ] #{todo} (from [[#{file}]])" end)
  end

  defp write_report(report, vault_path) do
    filename = "#{Date.utc_today()}_summary.md"
    path = Path.join([vault_path, "journal", filename])
    File.write(path, report)
  end

  # ... (remaining functions)
end
