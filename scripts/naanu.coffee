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
    msg.http("https://www.kimonolabs.com/api/7nxm7ms8?apikey=2072491dbe0b01c9504c3d2c953e8319")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          message = "Naanu Menu for: #{json.lastsuccess}\n"
          for menukey, menuitem of json.results.naanu_daily
            message = message + "- #{menuitem.name} #{menuitem.price}\n"  if menuitem.price != ""
          msg.send message
        catch error
          msg.send "Couldn't get Naanu Menu, sry no food for you."
