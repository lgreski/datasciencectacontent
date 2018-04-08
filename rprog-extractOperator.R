#
# R code for Forms of the Extract Operator article
#

# stored in datasciencectacontent

download.file("https://github.com/lgreski/PokemonData/raw/master/pokemonData.zip","pokemonData.zip",
               mode="wb",method="wininet")

unzip("pokemonData.zip")

thePokemonFiles <- list.files("./pokemonData",
                              full.names=TRUE)[1:2]
thePokemonFiles

pokemonData <- lapply(thePokemonFiles,function(x) read.csv(x)[["Attack"]])

# show the list of vectors
summary(pokemonData)

attackStats <- unlist(pokemonData)
hist(attackStats,
     main="Pokemon Attack Stats: Gen 1 & 2")