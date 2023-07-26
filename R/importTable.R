
#### Importation d'une table simple. Si le fichier importé est de type .xlsx, la table sera transformée en data.table
importTable_f <- function(chemin) {
  library(data.table)
  library(readxl)
  library(janitor)
  # Demander le chemin du fichier
  # reponse <- readline("Importation des données. Fournissez le lien exact du fichier de données, sans guillemets:  ")

  # Vérifier si le chemin conduit au fichier
  if(!file.exists(chemin)) {
    stop("Vérifier le chemin du fichier")
  }

  # Vérifier si la table est dans un format approprié
  if(!grepl(pattern = "([ct]sv$)|(xlsx$)", chemin)) {
    stop("Le fichier doit avoir une extension .xlsx, .tsv ou .csv")
  }

  # Importation de la table brute
  if(!grepl(pattern = "xlsx$", chemin)) {
    x <- fread(chemin)
  } else {
    x <- read_excel(chemin, sheet = 1) |> setDT()
  }

  # Modification des noms de colonnes au besoin
  names(x) <- janitor::make_clean_names(names(x))

  return(x)
}
