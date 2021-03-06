require(tidyverse)


clean_data <- function(data) {
  data <- data %>%
    ungroup() %>%
    # Reorder axis
    mutate(axis = relevel(factor(axis),'Mel')) %>%
    mutate(axis = recode_factor(axis, Mel = "Melanopsin", LMS = "Luminance")) %>%
    
    # Rename
    rename_participants()
  return(data)
}

rename_participants <- function(data){
  data <- data %>%
    ungroup() %>%
    # Rename participants
    mutate(participant = recode_factor(participant, 
                                       HERO_GKA = "Participant 1", 
                                       HERO_DHB = "Participant 2", 
                                       HERO_JXV = "Participant 3",
                                       MELA_0167 = "Participant 4",
                                       MELA_0171 = "Participant 5",
                                       MELA_0188 = "Participant 6"))
  return(data)
}