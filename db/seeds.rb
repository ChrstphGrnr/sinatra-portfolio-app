# dummy data to test my app

# Delete all prior database entries first!

User.destroy_all
Trail.destroy_all

# Users

christoph = User.create(name: "Christoph", email: "asd@asd.com", password: "password")

hillary = User.create(name: "Hillary", email: "qwe@qwe.com", password: "password")

elliott = User.create(name: "Elliott", email: "edog@edog.com", password: "password")

jack = User.create(name: "Jack", email: "jack@jack.com", password: "password")


#Trails 

Trail.create(name: "Blodget Peak", description: "This is the description of the trail", user_id: christoph.id)
Trail.create(name: "Mount Herman", description: "This is another description of another trail", user_id: hillary.id)
Trail.create(name: "Cannonball", description: "This is a crazy trail in the woods.", user_id: christoph.id)
Trail.create(name: "Barr Trail", description: "There is no description yet.", user_id: jack.id)
Trail.create(name: "Cheyenne Mountain Canyon", description: "This needs to be filled", user_id: elliott.id)

