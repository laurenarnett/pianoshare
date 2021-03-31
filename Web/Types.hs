module Web.Types where

import IHP.LoginSupport.Types
import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction
                      | CalendarAction
                      deriving (Eq, Show, Data)

data UsersController
    = UsersAction
    | NewUserAction
    | ShowUserAction { userId :: !(Id User) }
    | CreateUserAction
    | EditUserAction { userId :: !(Id User) }
    | UpdateUserAction { userId :: !(Id User) }
    | DeleteUserAction { userId :: !(Id User) }
    deriving (Eq, Show, Data)


instance HasNewSessionUrl User where
  newSessionUrl _ = "/NewSession"

type instance CurrentUserRecord = User

data SessionsController
  = NewSessionAction
  | CreateSessionAction
  | DeleteSessionAction
  deriving (Eq, Show, Data)

data SpacesController
    = SpacesAction
    | NewSpaceAction
    | ShowSpaceAction { spaceId :: !(Id Space) }
    | CreateSpaceAction
    | EditSpaceAction { spaceId :: !(Id Space) }
    | UpdateSpaceAction { spaceId :: !(Id Space) }
    | DeleteSpaceAction { spaceId :: !(Id Space) }
    deriving (Eq, Show, Data)

data CitiesController = CitiesAction deriving (Eq, Show, Data)
  

data ReservationsController
    = ReservationsAction
    | NewReservationAction { spaceId :: !(Id Space) }
    | ShowReservationAction { reservationId :: !(Id Reservation) }
    | CreateReservationAction { spaceId :: !(Id Space) }
    | EditReservationAction { reservationId :: !(Id Reservation) }
    | UpdateReservationAction { reservationId :: !(Id Reservation) }
    | DeleteReservationAction { reservationId :: !(Id Reservation) }
    deriving (Eq, Show, Data)
