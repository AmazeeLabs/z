# Description:
#   Naanu Daily menu
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot naanu - returns the current Menu at Naanu
#


module.exports = (robot) ->
  robot.respond /naanu/i, (msg) ->
    msg.http("http://www.kimonolabs.com/api/7nxm7ms8?apikey=2072491dbe0b01c9504c3d2c953e8319")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          message = "Naanu Menu for: #{json.lastsuccess}\n"
          for menukey, menuitem of json.results.naanu_daily
            message = message + "- #{menuitem.name} #{menuitem.price}\n"  if menuitem.price != ""
          msg.send message
        catch error
          msg.send "Gem not found. It will be mine. Oh yes. It will be mine. *sinister laugh*"