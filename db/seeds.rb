u1 = User.create(name:"Alex",email:"abc@email.com",password:"123456789")

u2 = User.create(name:"Max Mustermann",email:"def@email.com",password:"123456789")
u2 = User.create(name:"Tim Mustermann",email:"def1@email.com",password:"123456789")
u2 = User.create(name:"Felix Mustermann",email:"def2@email.com",password:"123456789")
u2 = User.create(name:"Tom Mustermann",email:"def3@email.com",password:"123456789")
u2 = User.create(name:"Sigmund Mustermann",email:"def4@email.com",password:"123456789")
u2 = User.create(name:"Phillip Mustermann",email:"def5@email.com",password:"123456789")
u2 = User.create(name:"Vera Mustermann",email:"def6@email.com",password:"123456789")
u2 = User.create(name:"Krassus Mustermann",email:"def7@email.com",password:"123456789")
u2 = User.create(name:"Noch Jemand Mustermann",email:"def8@email.com",password:"123456789")

 q = Quote.create(text:"wir machen hier keine Intervall-Rechnung!",quoted:"Herr Berning",user:u1)
