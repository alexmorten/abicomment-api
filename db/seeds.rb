user1 = User.create(name: "Max Mustermann",age: 15)
user2 = User.create(name: "Ella Bella",age: 17)
user3 = User.create(name: "Rudolf von Arschgeweih",age: 69)

comment1 = Comment.create(user: user1,text: "Du bist toll")
comment2 = Comment.create(user: user1,text: "Nee ist er nicht")
comment3 = Comment.create(user: user2,text: "Ewww")
comment4 = Comment.create(user: user2,text: "Hallo")
