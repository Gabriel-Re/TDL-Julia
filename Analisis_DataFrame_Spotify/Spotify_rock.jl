#= 
    Paquetes a añadir son CSV, DataFrames, Plots y DataVoyager
=#

using CSV, DataFrames, DataVoyager

df = DataFrame(CSV.File("Spotify-2000.csv"))

vscodedisplay(df)

df = rename( df, Symbol("Top Genre") => :Top_Genre)
rename!(df, Symbol("Beats Per Minute (BPM)") => :BPM)
rename!(df, Symbol("Loudness (dB)") => :Loudness)
rename!(df, Symbol("Length (Duration)") => :Duration)

rock_df = filter(:Top_Genre => x-> occursin("rock", x), df)

vscodedisplay(rock_df)

explorer = Voyager(rock_df)

using StatsPlots
plotlyjs(size = (850, 400))

K = Int(round(1+3.322 * log(nrow(rock_df) ) ) )

p_histogram = 