module Web.View.Spaces.Show where
import Web.View.Prelude



data ShowView = ShowView { space :: Space, user :: User, reservations :: [Reservation]}

utcTimeToYearMonthDay :: UTCTime -> (Integer, Int, Int)
utcTimeToYearMonthDay = toGregorian . utctDay -- (year,month,day)

parseDay :: String -> Day
parseDay = parseTimeOrError True defaultTimeLocale "%Y-%m-%d"

instance View ShowView where
    html ShowView { .. } = [hsx|
        <h1>{get #title space}</h1>
        <h2>{get #firstname user}'s practice room</h2>
        <div id="button">
            <a href={NewReservationAction (get #id space)}>Book</a>
        </div>
        <p>In {get #locality space}</p>
        <p>{get #summary space}</p>
        <p>Posted {get #createdAt space |> timeAgo}</p>
        <!-- {renderCalendar} -->
        <h3>Reservations</h3>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Reservation</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach reservations renderReservation}</tbody>
            </table>
        </div>
    |]
      where
        renderReservation reservation = [hsx|
            <tr>
                <td>{reservation}</td>
                <td>{utctDay (get #startDatetime reservation)}</td>
                <td><a href={ShowReservationAction (get #id reservation)}>Show</a></td>
                <td><a href={EditReservationAction (get #id reservation)} class="text-muted">Edit</a></td>
                <td><a href={DeleteReservationAction (get #id reservation)} class="js-delete text-muted">Delete</a></td>
            </tr>
        |]

        renderCalendar = [hsx|
            <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/main.js"></script>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/main.css">
            <script>
              document.addEventListener('DOMContentLoaded', function() {
                var calendarEl = document.getElementById('calendar');

                var calendar = new FullCalendar.Calendar(calendarEl, {

                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,listYear'
                    },

                    displayEventTime: false, // don't show the time column in list view

                    eventClick: function(arg) {
                        // opens events in a popup window
                        alert("wip");

                        arg.jsEvent.preventDefault() // don't navigate in main tab
                    },

                    loading: function(bool) {
                        document.getElementById('loading').style.display =
                        bool ? 'block' : 'none';
                    },
                    events: [
                        {
                        title: 'All Day Event',
                        start: '2021-03-01'
                        },
                        {
                        title: 'Long Event',
                        start: '2021-03-07',
                        end: '2021-03-10'
                        },
                        {
                        groupId: 999,
                        title: 'Repeating Event',
                        start: '2021-03-09T16:00:00'
                        },
                        {
                        groupId: 999,
                        title: 'Repeating Event',
                        start: '2021-03-16T16:00:00'
                        },
                        {
                        title: 'Conference',
                        start: '2021-03-11',
                        end: '2021-03-13'
                        },
                        {
                        title: 'Meeting',
                        start: '2021-03-12T10:30:00',
                        end: '2021-03-12T12:30:00'
                        },
                        {
                        title: 'Lunch',
                        start: '2021-03-12T12:00:00'
                        },
                        {
                        title: 'Meeting',
                        start: '2021-03-12T14:30:00'
                        },
                        {
                        title: 'Happy Hour',
                        start: '2021-03-12T17:30:00'
                        },
                        {
                        title: 'Dinner',
                        start: '2021-03-12T20:00:00'
                        },
                        {
                        title: 'Birthday Party',
                        start: '2021-03-13T07:00:00'
                        },
                        {
                        title: 'Click for Google',
                        url: 'http://google.com/',
                        start: '2021-03-28'
                        }
                    ]
              });

                  calendar.render();
              });

            </script>
            <div id="loading">loading...</div>
            <div id="calendar"></div>
        |]

