library(ggplot2)
data(MovieLense)
install.packages("recommenderlab")
library(recommenderlab)
data(MovieLense)

class(MovieLense)

object.size(as(MovieLense, "matrix"))

??cosine

## User based similarity measure

similarity_users = similarity(MovieLense[, ], method = "cosine", which = "users")
class(similarity_users)

 UCB_matrix = as.matrix(similarity_users)

ucb = as.data.frame(UCB_matrix)

### Item based similarity measure

similarity_items = similarity(MovieLense[, 1:10], method = "cosine", which = "items")
abc = as.matrix(similarity_items)
abc = as.data.frame(abc)

image(as.matrix(similarity_items), main = "Item similarity")

## User base similarity - recommendations

usr_rec = Recommender(MovieLense, method = "UBCF")

 
u_recom =  predict(usr_rec, MovieLense[1:3], n = 5)

as(u_recom, "list")

### Item based similarity  - recommendations 

I_rec = Recommender(MovieLense, method = "IBCF")


I_recom =  predict(I_rec, MovieLense[1:5], n = 3)
I_recom
as(I_recom, "list")