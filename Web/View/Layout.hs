module Web.View.Layout (defaultLayout, Html) where

import IHP.ViewPrelude
import IHP.Environment
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A
import Generated.Types
import IHP.Controller.RequestContext
import Web.Types
import Web.Routes

defaultLayout :: Bool -> Html -> Html
defaultLayout isLoggedIn inner = H.docTypeHtml ! A.lang "en" $ [hsx|
<head>
    {metaTags}

    {stylesheets}
    {scripts}

    <title>PianoShare</title>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href={SpacesAction}>
        <img src="https://avatars.githubusercontent.com/u/22421815?s=460&u=7d132201a67dd4edf2ad6ece72cb1e1c63804fb8&v=4" width="30" height="30" class="d-inline-block align-top" alt="">
        PianoShare
    </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
        <ul class="navbar-nav mr-auto my-2 my-lg-0 navbar-nav-scroll" style="max-height: 100px;">
            <li class="nav-item active">
                <a class="nav-link" href={SpacesAction}>Spaces<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href={UsersAction}>Users</a>
            </li>
        </ul>
    <a href={loginAction} class={loginClass} style="background-color: #268bd2; padding: 0.5rem; border-radius: 3px; color: hsla(205, 69%, 98%, 1); text-decoration: none; font-weight: bold; display: inline-block; box-shadow: 0 4px 6px hsla(205, 69%, 0%, 0.08);  transition: box-shadow 0.2s; transition: transform 0.2s;">{buttonText}</a>
    </div>
    </nav>
</head>
<body>
    <div class="container mt-4">
        {renderFlashMessages}
        {inner}
    </div>
</body>
|]
  where
    loginAction = if isLoggedIn then DeleteSessionAction else NewSessionAction
    loginClass :: Text
    loginClass = if isLoggedIn then "js-delete js-delete-no-confirm" else ""
    buttonText :: Text
    buttonText = if isLoggedIn then "Logout" else "Login"

stylesheets :: Html
stylesheets = [hsx|
        <link rel="stylesheet" href="/vendor/bootstrap.min.css"/>
        <link rel="stylesheet" href="/vendor/flatpickr.min.css"/>
        <link rel="stylesheet" href="/app.css"/>
    |]

scripts :: Html
scripts = [hsx|
        <script id="livereload-script" src="/livereload.js"></script>
        <script src="/jquery-3.5.1.min.js"></script>
        <script src="/vendor/timeago.js"></script>
        <script src="/vendor/popper.min.js"></script>
        <script src="/vendor/bootstrap.min.js"></script>
        <script src="/vendor/flatpickr.js"></script>
        <script src="/helpers.js"></script>
        <script src="/vendor/morphdom-umd.min.js"></script>
        <script src="/ihp-auto-refresh.js"></script>
    |]

metaTags :: Html
metaTags = [hsx|
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta property="og:title" content="App"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="TODO"/>
    <meta property="og:description" content="TODO"/>
    {autoRefreshMeta}
|]
