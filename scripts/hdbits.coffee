# Description:
#   A way to interact with the Google Web API.
#
# Commands:
#   hubot google|g|구글 <query> - Queries Google Web for <query> and returns the first result.

module.exports = (robot) ->
  robot.respond /(h|hdbits) (.*)/i, (msg) ->
    hdbitsMe msg, msg.match[2], (url) ->
      msg.send url

#hdbitsMe = (msg, query, cb) ->
#  msg.http('https://hdbits.org/api/test')
#    .query({"username":"blargdiesel","passkey":"5a96ac5dc8a160be40f9bf4ceb7de2f0"})
#    .post() (err, res, body) ->
#      pages = JSON.parse(body)
#      pages = pages.responseData?.results
#      if pages?.length > 0
#        page = pages[0]
#        cb "*#{page.titleNoFormatting}*\n_ #{page.unescapedUrl} _"
hdbitsMe = (msg, query, cb) ->
  msg.http("https://hdbits.org/api/test")
    .header('Accept', 'application/json')
    .get() (err, res, body) ->
      # error checking code here

      data = JSON.parse body
      res.send "#{data}"
