module Web.FrontController where

import IHP.RouterPrelude
import IHP.LoginSupport.Middleware
import Web.Controller.Prelude
import Web.Controller.Sessions
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Spaces
import Web.Controller.Users
import Web.Controller.Static
import Web.Controller.Cities

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        , parseRoute @SessionsController -- login controller
        , parseRoute @CitiesController
        -- Generator Marker
        , parseRoute @SpacesController
        , parseRoute @UsersController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
        initAuthentication @User
