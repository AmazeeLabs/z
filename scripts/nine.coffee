# Description:
#   Nine Status
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot nine - returns the current status entries at nine
#
module.exports = (robot) ->
  robot.respond /nine/i, (msg) ->
    msg.http("https://status.nine.ch/de/status_entries.json")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          for elem in json
            message = ""
            message = message + "(allthethings)#{elem.state} - #{elem.title}\n"
            message = message + "#{elem.message}\n"
            message = message + "#{elem.url}\n"
            message = message + "\n"
            msg.send message
        catch error
          msg.send "Couldn't get Nine Status - Sorry I'm a bad robot #sadrobot"
