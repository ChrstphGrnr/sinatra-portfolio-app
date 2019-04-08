# dummy data to test my app


#Users

christoph = User.create(name: "Christoph", email: "asd@asd.com", password: "password")

hillary = User.create(name: "Hillary", email: "qwe@qwe.com", password: "password")


#Trails 

Trail.create(name: "Blodget Peak", description: "This is the description of the trail", user_id: christoph.id)
Trail.create(name: "Mount Herman", description: "This is another description of another trail", user_id: hillary.id)


#using AR to force connect users and trails


christoph.trails.create(name: "Barr Trail", description: "There is no description yet.")
hillary.trails.create(name: "Cheyenne Mountain Canyon", description: "This needs to be filled")

