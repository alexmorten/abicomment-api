u1 = User.create(forename:"Alex",name:"Martin",email:"abc@email.com",password:"123456789")

u2 = User.create(forename:"Max",name:"Mustermann",email:"def@email.com",password:"123456789")
u2 = User.create(forename:"Tim",name:"Mustermann",email:"def1@email.com",password:"123456789")
u2 = User.create(forename:"Felix",name:"Mustermann",email:"def2@email.com",password:"123456789")
u2 = User.create(forename:"Tom",name:"Mustermann",email:"def3@email.com",password:"123456789")
u2 = User.create(forename:"Sigmund",name:"Mustermann",email:"def4@email.com",password:"123456789")
u2 = User.create(forename:"Phillip",name:"Mustermann",email:"def5@email.com",password:"123456789")
u2 = User.create(forename:"Vera",name:"Mustermann",email:"def6@email.com",password:"123456789")
u2 = User.create(forename:"Krassus",name:"Mustermann",email:"def7@email.com",password:"123456789")
u2 = User.create(forename:"Noch Jemand",name:"Mustermann",email:"def8@email.com",password:"123456789")

 q = Quote.create(text:"wir machen hier keine Intervall-Rechnung!",quoted:"Herr Berning",user:u1)


p1 = Poll.create(topic:"Wer wird der naechste Bundeskanzler?")
  v11=Option.create(title:"max",poll:p1)
  v12=Option.create(title:"tom",poll:p1)

p2 = Poll.create(topic:"Wer gewinnt?")
  v21=Option.create(title:"Niemand",poll:p2)
  v22=Option.create(title:"Jemand",poll:p2)
p3 = Poll.create(topic:"Wer kuemmert sich um die umfragen?")
  v31=Option.create(title:"Keiner",poll:p3)
  v32=Option.create(title:"Ich",poll:p3)
