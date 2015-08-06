# Description:
#  Make sure it's easy for everyone to access
#  our company tools and don't repeat the devops repeat the same links all the time ;)
#
#

kibana = [
  "The Logfiles can be accessed here:",
  "http://amazeeadmin.amazee.io.dev.dev1.compact.amazee.io/kibana/#/dashboard/elasticsearch/SyslogView",
  "You need also to open an SSH Tunnel:",
  "ssh elasticsearch@amalabs3.nine.ch -N -L 9200:127.0.0.1:9200"
  ]

elasticsearch = [
  "Elasticsearch can be accessed here:",
  "http://amazeeadmin.amazee.io.dev.dev1.compact.amazee.io/elasticsearch/"
  ]

vagrant = [
  "(allthethings): Get yourself started with Vagrant",
  "http://confluence.amazeelabs.com/display/KNOWLEDGE/Vagrant"
  ]

drushdeploy = [
  "You were talking about Drush Deploy?",
  "http://confluence.amazeelabs.com/display/KNOWLEDGE/Drush+Deploy+-+Install+and+Use"
  ]


module.exports = (robot) ->
  robot.respond /(url)?/i, (msg) ->
    text = msg.message.text

    if text.match(/(syslog|logs|kibana)/i)
      msg.send kibana.join('\n')

    if text.match(/elasticsearch/i)
      msg.send elasticsearch.join('\n')

    if text.match(/vagrant/i)
      msg.send vagrant.join('\n')

    if text.match(/drush-deploy/i)
      msg.send drushdeploy.join('\n')


