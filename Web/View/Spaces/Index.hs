module Web.View.Spaces.Index where
import Web.View.Prelude

data IndexView = IndexView { spaces :: [Space] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={SpacesAction}>Spaces</a></li>
            </ol>
        </nav>
        <script src="https://cdn.jsdelivr.net/gh/xcash/bootstrap-autocomplete@v2.3.7/dist/latest/bootstrap-autocomplete.min.js"></script>
        <script>console.log("yo1");</script>
        <script src="/autocomplete.js"></script>
        <div class="form-row form-group">
          <div class="col">
            <input class="form-control basicAutoComplete" type="text" data-url="Cities" autocomplete="off">
          </div>
          <div class="col">
            <a href={pathTo NewSpaceAction} class="from-control btn btn-primary">Submit</a>
          </div>
        </div>
        <h1>Rehearsal Spaces in City <a href={pathTo NewSpaceAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Space</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach spaces renderSpace}</tbody>
            </table>
        </div>
    |]


renderSpace space = [hsx|
    <tr>
        <td>{space}</td>
        <td><a href={ShowSpaceAction (get #id space)}>Show</a></td>
        <td><a href={EditSpaceAction (get #id space)} class="text-muted">Edit</a></td>
        <td><a href={DeleteSpaceAction (get #id space)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
