# Description:
#   Make sure it's easy for everyone to access our company tools
#     - kibana
#     - elasticsearch
#
# Commands:
#   hubot url ...

kibana = [
  "The Logfiles can be accessed here:",
  "http://amazeeadmin.amazeeweb1.nine.ch/kibana/"
  ]

elasticsearch = [
  "Elasticsearch can be accessed here:",
  "http://amazeeadmin.amazeeweb1.nine.ch/elasticsearch/"
  ]

jenkins = [
  "Jenkins can be accessed here:",
  "http://jenkins.amazeelabs.com"
  ]

module.exports = (robot) ->
  robot.respond /(url)?/i, (msg) ->
    text = msg.message.text

    if text.match(/(syslog|logs|kibana)/i)
      msg.send kibana.join('\n')

    if text.match(/elasticsearch/i)
      msg.send elasticsearch.join('\n')

    if text.match(/jenkins/i)
      msg.send jenkins.join('\n')
