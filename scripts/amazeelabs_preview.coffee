# Description:
#   Listens for preview links and posts them that we see the image in the chat
#
# Description:
#   Display issue/page information from drupal.org
#
# Configuration:
#   NONE
#
# Commands:
#   preview.amazeelabs.com URL - will parse url and send picture
#
# Author:
#   Bastian Widmer - @dasrecht

module.exports = (robot) ->
  parseUrl = (msg) ->
    result = msg.match[0]
    result = result.replace /\.html/, ""
    result = result.replace /\/f\//, "/"
    msg.send result

  # listen for page links
  robot.hear /http:\/\/preview.amazeelabs.com\/(.*)\/(.*).html/, parseUrl
