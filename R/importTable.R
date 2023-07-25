library(data.table)
library(readxl)

#### Importation d'une table simple. Si le fichier importé est de type .xlsx, la table sera transformée en data.table
importTable_f <- function() {
  # Demander le chemin du fichier
  reponse <- readline("Importation des données. Fournissez le lien exact du fichier de données, sans guillemets:  ")

  # Vérifier si le chemin conduit au fichier
  if(!file.exists(reponse)) {
    stop("Vérifier le chemin du fichier")
  }

  # Vérifier si la table est dans un format approprié
  if(!grepl(pattern = "([ct]sv$)|(xlsx$)", reponse)) {
    stop("Le fichier doit avoir une extension .xlsx, .tsv ou .csv")
  }

  # Importation de la table brute
  if(!grepl(pattern = "xlsx$", reponse)) {
    x <- fread(reponse)
  } else {
    x <- read_excel(reponse, sheet = 1) |> setDT()
  }
  return(x)
}
