# Fonction pour agréger les documents par décennie
# Prend en entrée une année sous forme de chaîne de caractères
# S'utilise idéalement avec lapply()
decennie_f <- function(x) {
  decennies <- factor(paste0(str_sub(x, 1,3),0))
  return(decennies)
}
