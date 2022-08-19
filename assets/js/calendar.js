var parser = new ICAL.ComponentParser({ parseEvent: true });
var events = [];
var exceptions = Object.create(null);

parser.onevent = function(item) {
  if (item.isRecurrenceException()) {
    var uid = item.uid;
    if (!(uid in exceptions)) {
      exceptions[uid] = [];
    }
    exceptions[uid].push(item);
  } else {
    events.push(item);
  }
};

parser.oncomplete = function() {
  var output = new ICAL.Event();
  events.forEach(function(item) {
    var uid = item.uid;
    if (uid in exceptions) {
      exceptions[uid].forEach(item.relateException, item);
    }

    // Let's figure out the upcoming event
    var now = new Date();
    if (item.isRecurring()) {
      var iterator = item.iterator();
      var next = new ICAL.Time();
      while ( next.toJSDate() < now && (next = iterator.next())) {
        var details = item.getOccurrenceDetails(next);
        // Later than now
        if (details.startDate.toJSDate() > now) {
          // Earlier than the other dates in the iterator (closer to today)
          if (!output.startDate || details.startDate < output.startDate) {
            output = details.item;
            output.startDate = details.startDate;
            output.endDate = details.endDate;
          }
        }
      }
    } // Once again, later than now
    else if (item.startDate.toJSDate() > now) {
      // And again, earlier than the other dates (closer to today)
      if (!output.startDate || item.startDate < output.startDate) {
        output = item;
      }
    }
  });

  if (output.startDate) {
    var date = new Date(output.startDate);
    document.getElementById("calendar").innerHTML =
    '<h5>' + output.summary + '</h5>' +
    '<p class="text-muted">' + date + '</p>' +
    '<p>' + output.description.substr(0,255) + '…</p>' +
    '<a href="' + output.location + '">' +
    output.location + '</a>';
  }
  else {
    document.getElementById("calendar").innerHTML = "No upcoming events";
  }
};

$.ajax({
  url: "https://cors-anywhere.herokuapp.com/https://calendar.google.com/calendar/ical/ih4fh7ks327mou7e3hifikokco%40group.calendar.google.com/public/basic.ics"
})
.done(function( data ) {
  var jcalData = ICAL.parse(data);
  var calendar = new ICAL.Component(jcalData);
  parser.process(calendar);
});
