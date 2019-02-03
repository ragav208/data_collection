library(Rfacebook)
fb_oauth <- fbOAuth(app_id="2206412116237896", app_secret="889a997fc839bddd7ec449bea0086ea7",extended_permissions = TRUE)
save(fb_oauth, file="fb_oauth")

load("fb_oauth")
me <- getUsers("me",token=fb_oauth)
my_likes <- getLikes(user="me", token=fb_oauth)



token <- 'YOUR AUTHENTICATION TOKEN'
me <- getUsers("me", token, private_info=TRUE)

getUsers(c("barackobama", "donaldtrump"), token)