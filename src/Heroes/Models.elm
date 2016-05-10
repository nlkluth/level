module Heroes.Models (..) where


emptyHero : Hero
emptyHero =
  { id = 0
  , name = ""
  , title = ""
  , image = { full = "" }
  , stats = Nothing
  }

type alias HeroID = Int


type alias HeroImage =
  { full: String }


type alias Spells = List Spell


type alias Spell =
  { name : String
  , description : String
  , image : HeroImage
  , resource : String
  , maxRank : Int
  , cost : List Int
  }


type alias HeroStats =
  { armor : Float
  , armorperlevel : Float
  , attackdamage : Float
  , attackdamageperlevel : Float
  , attackrange : Float
  , attackspeedoffset : Float
  , attackspeedperlevel : Float
  , crit : Float
  , critperlevel : Float
  , hp : Float
  , hpperlevel : Float
  , hpregen : Float
  , hpregenperlevel : Float
  , movespeed : Float
  , mp : Float
  , mpperlevel : Float
  , mpregen : Float
  , mpregenperlevel : Float
  , spellblock : Float
  , spellblockperlevel : Float
  }


type alias Hero =
  { id: HeroID
  , name : String
  , title: String
  , image: HeroImage
  , stats: Maybe HeroStats
  }
