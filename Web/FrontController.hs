module Web.FrontController where

import IHP.RouterPrelude
import IHP.LoginSupport.Middleware
import Web.Controller.Prelude
import Web.Controller.Sessions
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Reservations
import Web.Controller.Spaces
import Web.Controller.Users
import Web.Controller.Static
import Web.Controller.Cities

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        , parseRoute @StaticController
        , parseRoute @SessionsController -- login controller
        , parseRoute @CitiesController
        -- Generator Marker
        , parseRoute @ReservationsController
        , parseRoute @SpacesController
        , parseRoute @UsersController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        initAutoRefresh
        initAuthentication @User
        case currentUserOrNothing of
          Just _ -> setLayout (defaultLayout True)
          Nothing -> setLayout (defaultLayout False)
