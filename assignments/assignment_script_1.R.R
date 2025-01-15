db = DB |>
     dplyr::filter(scenario == "RCP45", year == 2055, interval == "mon")
x = read_brickman(db)
x

long_values = dplyr::filter(long_values, name == "SST")

M01 = long_values |> filter(point == "p5")
ggplot(data = M01, mapping = aes(x = month, y = value)) + geom_point()