# Fonction générant les diagrammes à barres
diagramme_f <- function(data, x, y, titre, flip=TRUE, reorder = TRUE, legende){
  library(ggplot2)
  if(reorder){
    mapping = aes(x = reorder({{x}}, {{y}}), y = {{y}})
  } else {
    mapping = aes(x = {{x}}, y = {{y}})
  }
  graphique <- ggplot(data, mapping) +
    geom_bar(stat = "identity") +
    labs(title = titre,
         caption = legende)+
    xlab(NULL)+
    ylab(NULL)+
    theme_classic()
  if(flip) {
    graphique <- graphique +
      coord_flip() +
      geom_text(aes(label = N),
                hjust = 0,
                vjust = +0.8,
                size = 2.5,
                colour = "black")
  } else {
    graphique <- graphique +
      geom_text(aes(label = N),
                hjust = 0.5,
                vjust = -0.7,
                size = 2.5,
                colour = "black")
  }
  return(graphique)
}
