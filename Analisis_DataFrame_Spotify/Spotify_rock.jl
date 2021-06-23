#= 
    Paquetes a añadir son CSV, DataFrames y DataVoyager, Gadfly
=#

using CSV, DataFrames, DataVoyager

df = DataFrame(CSV.File("Spotify-2000.csv"))

value_counts(df,col) = sort!(combine(groupby(df, [col]), nrow => :count), [:count], rev = true)

vscodedisplay(df)

df = rename( df, Symbol("Top Genre") => :Top_Genre)
rename!(df, Symbol("Beats Per Minute (BPM)") => :BPM)
rename!(df, Symbol("Loudness (dB)") => :Loudness)
rename!(df, Symbol("Length (Duration)") => :Duration)

rock_df = filter(:Top_Genre => x-> occursin("rock", x), df) # Filtrar por genero de rock 

vscodedisplay(rock_df)

explorer = Voyager(rock_df) # Explorador de Datos inicial

####################################################################################################


rock_records_per_year = value_counts(rock_df, "Year")

rock_records_per_year



using Gadfly # Libreira de ploteo amigable super integrado con DataFrames

set_default_plot_size(35cm, 25cm)

p = plot(rock_records_per_year,
    x = :Year,
    y = :count,
    color = :Year,
    Geom.bar(orientation = :vertical),
    Guide.xlabel("Year"),
    Guide.ylabel("Amount of Records"),
    Guide.title("Amount of Records per Year"),
    Guide.colorkey(title = "Year"),
    Scale.x_continuous(format = :plain),
    Theme(
        background_color = "white",
        bar_spacing = 1mm
    )
)

img = SVG("rock_records_per_year.svg", 35cm, 25cm)
draw(img, p)

####################################################################################################


top10_cantidad_records = first(value_counts(rock_df,"Top_Genre"),10)

vscodedisplay(top10_cantidad_records)

top_10_cantidad_df = innerjoin(rock_df, top10_cantidad_records, on = :Top_Genre)
vscodedisplay(top_10_cantidad_df)


p = plot(top_10_cantidad_df,
    x = :Year,
    y = :Popularity,
    color = :Top_Genre,
    Geom.bar,
    Guide.xlabel("Years"),
    Guide.ylabel("Popularity"),
    Guide.title("Popularity of Rock Songs over the years by genre"),
    Guide.colorkey(title = "Genre"),
    Theme(background_color = "white")
)

img = SVG("Los10generosDeRecordMasPopularesALoLargoDeLosAñosConMasRecords.svg", 35cm, 25cm)
draw(img, p)
#K = Int(round(1+3.322 * log(nrow(rock_df) ) ) )

####################################################################################################

los10_mas_populares_rock = first(rock_df[!,:Popularity],10)

vscodedisplay(los10_mas_populares_rock)

artistas_populares = filter(:Popularity => x-> x in los10_mas_populares_rock ,rock_df)

vscodedisplay(artistas_populares)

los10_artistas_mas_populares_con_mas_records = first( value_counts(artistas_populares,"Artist") ,10)

vscodedisplay(los10_artistas_mas_populares_con_mas_records)

top10_popularidad = innerjoin(rock_df, los10_artistas_mas_populares_con_mas_records, on = :Artist)

vscodedisplay(top10_popularidad)

p = plot(top10_popularidad,
    x = :Year,
    y = :count,
    color = :Artist,
    Geom.beeswarm,
    Guide.xlabel("Years"),
    Guide.ylabel("Cantidad de Records Totales"),
    Guide.title("The 10 Most Popular Artist over the years"),
    Guide.colorkey(title = "Artist"),
    Theme(background_color = "white")
)

img = SVG("Los10artistasMasPopulares.svg", 35cm, 25cm)
draw(img, p)