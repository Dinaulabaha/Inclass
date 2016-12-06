#curl -i -X GET \
##版本
#"https://graph.facebook.com/v2.8/
##要蒐的東西
#me/groups?
##認證碼對了才會搜上面的
#access_token=EAACEdEose0cBAMweOcjBi5JqHR4D7mpH99ZBxrZAmRlynxLQ0czXhTIvJ4YMwItOfjXvjwJKABn72Nyi1Ar7XMyuOnJ7ImCZBT3HTU92ArFEkAKuSgovxW5VJKdUWITZCWUi0ZCwjfnO3ZBXkXwoxk9mdL1ZBaBd2aS0O3F9Go3qAZDZD"

rm(list=ls(all.names = TRUE))

library(httr)
library(rjson)
library(httpuv)
library(Rfacebook)


prefex = "https://graph.facebook.com/v2.1/"
token  = "EAACEdEose0cBAHA56scB2zTcA5ZB3pvOvoNXZAnJWvN7CwEQNWztZCpW19ih3tebrDhdsjy0jEhmhgKCE7ZB8Ido7KL1SNrTYRzJGhR75KR7XjjMWAVcThjsYt8matq3vEYSSmS0f43VQ2b3noNklUAOEU40d2ceaCo5M3EfxwZDZD"

number = 20
attrs  = paste0("me/groups/?limit=", number, "&access_token=")

url    = paste0(prefex, attrs, token)
res    = GET(url)
data   = content(res)
groups = matrix(unlist(data$data))

after      = data$paging$cursors$after
while(after!="")
{
nexturl = paste0(url,"&after=",after)
nextres = GET(nexturl)
ndata   = content(nextres)
ngroups = matrix(unlist(ndata$data))
after   = ndata$paging$cursors$after
}

#while後面有問題!!
