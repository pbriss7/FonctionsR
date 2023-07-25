# Fonctions utiles

# Installation (si nécessaire) et activation de paquets
activerPaquets_f <- function(x) 
{
  # Quelles extensions installer? La question sera posée dans la console
  nom_paquet <- readline(prompt = "Quelles extensions activer? Sépare chaque nom d'extension par une virgule (ex.: data.table,dplyr,ggplot2). Réponse: ")
  
  # On segmente la réponse fournie en prenant la virgule comme élément séparateur
  nom_paquet_l <- strsplit(nom_paquet, ",")
  
  # Arrêt en cas de réponse nulle
  stopifnot(length(nom_paquet_l)>0)
  
  # liste ==> vecteur
  nom_paquet_v <- unlist(nom_paquet_l)
  
  # boucle sur les noms d'extensions (installation si nécessaire, puis activation)
  lapply(nom_paquet_v, function(x) {
    if(!x %in% installed.packages()) 
    {
      cat("Le paquet ", x, " et ses éventuels dépendances doivent être installés avant d'être activés.")
      install.packages(x, dependencies = TRUE)
      require(x, character.only = TRUE)
    } else {
        require(x, character.only = TRUE)
      }
  }
  )
  cat(nom_paquet_v, " installé(s) si nécessaire et activé(s)")
}
