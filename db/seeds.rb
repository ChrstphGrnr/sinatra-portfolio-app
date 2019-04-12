# dummy data to test my app

# Delete all prior database entries first!

User.destroy_all
Trail.destroy_all
Collection.destroy_all

# Users

christoph = User.create(name: "Christoph", email: "asd@asd.com", password: "password")

hillary = User.create(name: "Hillary", email: "qwe@qwe.com", password: "password")

elliott = User.create(name: "Elliott", email: "edog@edog.com", password: "password")

jack = User.create(name: "Jack", email: "jack@jack.com", password: "password")


#Trails 

Trail.create(name: "Blodget Peak", description: "This is the description of the trail", created_by_id: christoph.id)
Trail.create(name: "Mount Herman", description: "This is another description of another trail", created_by_id: hillary.id)
Trail.create(name: "Cannonball", description: "This is a crazy trail in the woods.", created_by_id: christoph.id)
Trail.create(name: "Barr Trail", description: "There is no description yet.", created_by_id: jack.id)
Trail.create(name: "Cheyenne Mountain Canyon", description: "This needs to be filled", created_by_id: elliott.id)

# Collections

collection_1 = Collection.create(name: "Summer2019", user_id: hillary.id)
collection_2 = Collection.create(name: "Into the woods", user_id: christoph.id)

user_trail_1 = UserTrail.create(user_id: 1, trail_id: 1)

user_trail_1.collection_id = collection_1.id


