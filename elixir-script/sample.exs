# https://hexdocs.pm/mix/Mix.html#install/2
Mix.install([
  :httpotion,
  :jason
])

resp = HTTPotion.get!("https://bookpiles.ca/jonathan/books.json")

resp.body
|> Jason.decode!()
|> Jason.encode!(pretty: true)
|> IO.puts()
