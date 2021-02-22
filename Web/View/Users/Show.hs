module Web.View.Users.Show where
import Web.View.Prelude

data ShowView = ShowView { user :: User }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={UsersAction}>Users</a></li>
                <li class="breadcrumb-item active">Show User</li>
            </ol>
        </nav>
        <h1>{get #username user}</h1>
        <p>{get #city user}</p>
        <p>Joined {get #createdAt user |> timeAgo}</p>
    |]
