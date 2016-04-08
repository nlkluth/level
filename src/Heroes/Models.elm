module Heroes.Models (..) where


type alias HeroID = Int


type alias Hero =
  { id: HeroID
  , name : String,
  title: String
  }
