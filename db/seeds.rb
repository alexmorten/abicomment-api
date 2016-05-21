u1 = User.create(name:"alex",email:"abc@email.com",password:"123456789")

u2 = User.create(name:"max",email:"def@email.com",password:"123456789")

 q = Quote.create(text:"wir machen hier keine Intervall-Rechnung!",quoted:"Herr Berning",user:u1)
