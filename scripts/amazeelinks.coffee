# Description:
#  Make sure it's easy for everyone to access
#  our company tools and don't repeat the devops repeat the same links all the time ;)
#
#

kibana = [
  "The Logfiles can be accessed here:",
  "http://amazeeadmin.amazeeweb1.nine.ch/kibana/#/dashboard/elasticsearch/SyslogView"
  ]

elasticsearch = [
  "Elasticsearch can be accessed here:",
  "http://amazeeadmin.amazeeweb1.nine.ch/elasticsearch/"
  ]

jenkins = [
  "Jenkins can be accessed here:",
  "http://jenkins.amazeelabs.com"
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

    if text.match(/jenkins/i)
      msg.send jenkins.join('\n')

    if text.match(/vagrant/i)
      msg.send vagrant.join('\n')

    if text.match(/drush-deploy/i)
      msg.send drushdeploy.join('\n')


