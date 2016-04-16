module Heroes.Models (..) where


emptyHero =
  { id = 0
  , name = ""
  , title = ""
  , image = { full = "" }
  }


type alias HeroID = Int


type alias HeroImage =
  { full: String }


type alias Hero =
  { id: HeroID
  , name : String
  , title: String
  , image: HeroImage
  }
