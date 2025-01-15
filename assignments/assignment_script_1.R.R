# Filter for our scenario
db = DB |>
     dplyr::filter(scenario == "RCP45", year == 2055, interval == "mon")
x = read_brickman(db)
x

# Extract SST data from the buoys
long_values = dplyr::filter(long_values, name == "SST")

# Filter to buoy M01
M01 = long_values |> filter(point == "p5")

# Plot SST by month
ggplot(data = M01, mapping = aes(x = month, y = value)) + geom_point()

# Get the months in order
ggplot(data = M01, mapping = aes(x = factor(month, month.abb), y = value)) + geom_point()