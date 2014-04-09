# Description:
#   Give, Take and List User stars
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot give <number> stars to <username> - award <number> stars to <username>
#   hubot give <username> <number> stars - award <number> stars to <username>
#   hubot take <number> stars from <username> - take away <number> stars from <username>
#   hubot how many stars does <username> have? - list how many stars <username> has
#
# Author:
#   brettlangdon with changes by Schnitzel
#

stars = {}

award_stars = (msg, username, pts) ->
    stars[username] ?= 0
    stars[username] += parseInt(pts)
    msg.send pts + ' Awarded To ' + username

save = (robot) ->
    robot.brain.data.stars = stars

module.exports = (robot) ->
    robot.brain.on 'loaded', ->
        stars = robot.brain.data.stars or {}

    robot.respond /give (\d+) stars to (.*?)\s?$/i, (msg) ->
        award_stars(msg, msg.match[2], msg.match[1])
        save(robot)

    robot.respond /give (.*?) (\d+) stars/i, (msg) ->
        award_stars(msg, msg.match[1], msg.match[2])
        save(robot)

    robot.respond /take (\d+) stars from (.*?)\s?$/i, (msg) ->
         pts = msg.match[1]
         username = msg.match[2]
         stars[username] ?= 0

         if stars[username] is 0
             msg.send username + ' Does Not Have Any stars To Take Away'
         else
             stars[username] -= parseInt(pts)
             msg.send pts + ' stars Taken Away From ' + username

         save(robot)

    robot.respond /how many stars does (.*?) have\??/i, (msg) ->
        username = msg.match[1]
        stars[username] ?= 0

        msg.send username + ' Has ' + stars[username] + ' stars'

