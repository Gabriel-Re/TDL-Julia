################################################################################
# DataFramesMeta
################################################################################

# Southern Asia Subregion countries using filter() from Julia Base

df_sa_base = filter(:subregion => x -> x == "Southern Asia", df_inner)
savehtml("df_sa_base", df_sa_base)

using DataFramesMeta

# Southern Asia Subregion countries using @where from DataFramesMeta

df_sa_dfm = @where(df_inner, :subregion .== "Southern Asia")
savehtml("df_sa_dfm", df_sa_dfm)

# multiple filters using @where macro

df_multi_filters = @where(df_inner,
    .|(:subregion .== "Southern Asia", :subregion .== "Northern America"),
    .&(:my19 .< 1, :gdppc .> 10)
)
savehtml("df_multi_filters", df_multi_filters)

# group, combine & calculate all in 1 step using @by macro

df_by_r = @by(df_inner, :region,
    my18_sum = sum(:my18),
    my19_sum = sum(:my19),
    mydelta_sum = sum(:mydelta),
    mypct_c = round.(sum(:mydelta) ./ sum(:my18) .* 100, digits = 2),
    my100_c = round.(sum(:my19) ./ sum(df_inner.my19) .* 100, digits = 2),
    gdp_sum = sum(:gdp),
    gdppc_c = round.(sum(:gdp) ./ sum(:my19), digits = 3)
)
savehtml("df_by_r", df_by_r)

# copy and paste code to summarize data by subregion

df_by_s = @by(df_inner, :subregion,
    region_unique = unique(:region),
    my18_sum = sum(:my18),
    my19_sum = sum(:my19),
    mydelta_sum = sum(:mydelta),
    mypct_c = round.(sum(:mydelta) ./ sum(:my18) .* 100, digits = 2),
    my100_c = round.(sum(:my19) ./ sum(df_inner.my19) .* 100, digits = 2),
    gdp_sum = sum(:gdp),
    gdppc_c = round.(sum(:gdp) ./ sum(:my19), digits = 3)
)
savehtml("df_by_s", df_by_s)

################################################################################
# Gadfly
################################################################################

using Gadfly

set_default_plot_size(16cm, 9cm)

# 1. bar plot by region

df_by_r = sort!(df_by_r, :my19_sum)

p = plot(df_by_r,
    x = :my19_sum,
    y = :region,
    color = :region,
    Geom.bar(orientation = :horizontal),
    Guide.xlabel("Population (mils)"),
    Guide.ylabel("Region"),
    Guide.title("2019 Population by Region"),
    Guide.colorkey(title = "Region"),
    Scale.x_continuous(format = :plain),
    Theme(
        background_color = "white",
        bar_spacing = 1mm
    )
)

# how to save plot

img = SVG("p_bar_region.svg", 16cm, 9cm)
draw(img, p)

# 2. bar plot by subregion

df_by_s = sort!(df_by_s, :my19_sum)

p = plot(df_by_s,
    x = :my19_sum,
    y = :subregion,
    color = :region_unique,
    Geom.bar(orientation = :horizontal),
    Guide.xlabel("Population (mils)"),
    Guide.ylabel("Subregion"),
    Guide.title("2019 Population by Subregion"),
    Guide.colorkey(title = "Region"),
    Scale.x_continuous(format = :plain),
    Theme(
        background_color = "white",
        bar_spacing = 1mm
    )
)

img = SVG("p_bar_subregion.svg", 16cm, 9cm)
draw(img, p)

# 3. point (scatter) plot by country

df_sub100 = @where(df_inner, :my19 .< 100)

p = plot(df_sub100,
    x = :my19,
    y = :mypct,
    color = :region,
    Geom.point,
    Guide.xlabel("Population (mils)"),
    Guide.ylabel("Growth Rate (%)"),
    Guide.title("2019 Population vs Growth Rate (sub 100 mil)"),
    Guide.colorkey(title = "Region"),
    Theme(background_color = "white")
)

img = SVG("p_point_country.svg", 16cm, 9cm)
draw(img, p)

# 4. beeswarm plot by region

p = plot(df_sub100,
    x = :region,
    y = :my19,
    color = :region,
    Geom.beeswarm,
    Guide.xlabel("Region"),
    Guide.ylabel("Population (mils)"),
    Guide.title("2019 Population Beeswarm by Region (sub 100 mil)"),
    Guide.colorkey(title = "Region"),
    Scale.y_continuous(format = :plain),
    Theme(background_color = "white")
)

img = SVG("p_beeswarm_region.svg", 16cm, 9cm)
draw(img, p)

# 5. box plot by region

p = plot(df_sub100,
    x = :region,
    y = :my19,
    color = :region,
    Geom.boxplot,
    Guide.xlabel("Region"),
    Guide.ylabel("Population (mils)"),
    Guide.title("2019 Population Boxplot by Region (sub 100 mil)"),
    Guide.colorkey(title = "Region"),
    Scale.y_continuous(format = :plain),
    Theme(background_color = "white")
)

img = SVG("p_boxplot_region.svg", 16cm, 9cm)
draw(img, p)

# 6. density plot by region

df_sub100_o = @where(df_sub100, :region .!= "Oceania")

p = plot(df_sub100_o,
    x = :my19,
    color = :region,
    Geom.density,
    Guide.xlabel("Population (mils)"),
    Guide.ylabel("Density"),
    Guide.title("2019 Population Density be Region (sub 100 mil ex Oceania)"),
    Guide.colorkey(title = "Region"),
    Scale.x_continuous(format = :plain),
    Theme(background_color = "white")
)

img = SVG("p_density_region.svg", 16cm, 9cm)
draw(img, p)

# 7. violin plot by region

p = plot(df_inner,
    x = :region,
    y = :gdppc,
    color = :region,
    Geom.violin,
    Guide.xlabel("Region"),
    Guide.ylabel(
        "GDP per Capita (dollars in 000s)",
        orientation = :vertical
    ),
    Guide.title("2019 GDP per Capita by Region"),
    Guide.colorkey(title = "Region"),
    Scale.y_continuous(format = :plain),
    Coord.cartesian(ymin = -25, ymax = 75),
    Theme(background_color = "white")
)

img = SVG("p_violin_region.svg", 16cm, 9cm)
draw(img, p)