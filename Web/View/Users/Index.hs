module Web.View.Users.Index where
import Web.View.Prelude

data IndexView = IndexView { users :: [User], greeting :: Text }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <h2>{greeting}</h2>
        <h1>All Users <!-- <a href={pathTo NewUserAction} class="btn btn-primary ml-4">+ New</a> --> </h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>User</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach users renderUser}</tbody>
            </table>
        </div>
    |]


renderUser user = [hsx|
    <tr>
        <td><a href={ShowUserAction (get #id user)}>{get #username user}</a></td>
        <td><a href={EditUserAction (get #id user)} class="text-muted">Edit</a></td>
        <td><a href={DeleteUserAction (get #id user)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
