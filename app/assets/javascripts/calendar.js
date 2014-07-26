$(document).ready(function() {
  $('#calendar').fullCalendar({
      weekends: true, 
      aspectRatio: 2,
      header: {
        left:   'title',
        center: 'month, basicWeek',
        right:  'today prev,next'
      },
      eventSources: [
        {
            url: 'https://www.google.com/calendar/feeds/captrafiki%40gmail.com/public/basic',
            dataType : 'gcal',
            error: function() {
                alert('there was an error while fetching events!');
            },
            color: 'yellow',   // a non-ajax option
            textColor: 'black' // a non-ajax option
        },
        { 
          events: [
            {
              title : 'HC Event',
              start : '2014-07-29'
            }
          ]
        }
    ]

  });
});
