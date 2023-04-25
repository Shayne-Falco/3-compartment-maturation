using BenchmarkTools
using DataFrames
using DelimitedFiles
using CSV
using XLSX
using Downloads
          
#P = Downloads.download("https://raw.githubusercontent.com/nassarhuda/easy_data/master/programming_languages.csv","programming_languages.csv")

P,H = readdlm("programming_languages.csv",',';header=true);

C = CSV.read("programming_languages.csv",DataFrame);

@show typeof(C)
#C[1:10,:]
#C.year

#describe(C)

#CSV.write("programming_languages_CSV.csv",DataFrame(P,:auto))

P 

function year_created(P,language::String)
    loc = findfirst(P.language .== language)
    !isnothing(loc) && return P.year[loc]
    error("Error: Language $language not found.")
end

year_created(C,"Julia")
#year_created(P,"W")

