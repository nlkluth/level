module Heroes.Models (..) where


type alias HeroID = Int


type alias HeroImage =
  { full: String }


type alias Hero =
  { id: HeroID
  , name : String
  , title: String
  , image: HeroImage
  }
