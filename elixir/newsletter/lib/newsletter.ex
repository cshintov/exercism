defmodule Newsletter do
  def read_emails(path) do
    path
    |> emails_stream
    |> Enum.to_list
  end

  defp emails_stream(path), do:
    path
    |> File.stream!
    |> Stream.map(&String.trim/1)

  def open_log(path), do: path |> File.open!([:write])

  def log_sent_email(pid, email), do: pid |> IO.puts(email)

  def close_log(pid), do: pid |> File.close

  def send_newsletter(emails_path, log_path, send_fun) do
    logpid = open_log(log_path)
    do_send_email = &send_email(&1, logpid, send_fun)

    emails_path
    |> emails_stream
    |> Stream.each(do_send_email)
    |> Stream.run

    close_log(logpid)
  end

  defp send_email(email, logpid, send_fun) do
    case send_fun.(email) do
      :ok -> log_sent_email(logpid, email)
      _   -> IO.puts("Error! Couldn't send email!")
    end
  end
end
