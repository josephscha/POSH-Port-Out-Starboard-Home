# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.destroy_all
ObjectType.destroy_all
User.destroy_all
Artwork.destroy_all

require 'byebug'
require 'rest-client'
require 'json'

#creating admin account to hold all artworks during seeds. pw: posh
User.create(name: "POSH", email: "posh@gmail.com", location: "POSH HQ", bio: "The poshiest", img_url: "https://pbs.twimg.com/profile_images/589180553024430080/tZaEkx9F_400x400.jpg", password_digest: "$2a$12$G2f3yp1/.GHzmeR3dgwRrevAquO5b32PIhll3FogGwQF9lWNbr1UG")

# object_name_arr = ["Sculpture", "Print", "Tapestry", "Origami", "Digital", "Pottery", "Literature","Painting"]

# object_name_arr.each do |object|
#     ObjectType.create(name: object)
# end

def find_artist(name)
    Artist.find_or_create_by(name: name)
end


def find_object(name)
    ObjectType.find_or_create_by(name: name)
end

'https://collectionapi.metmuseum.org/public/collection/v1/search?isHighlight=true&q=monet'

'https://collectionapi.metmuseum.org/public/collection/v1/search?isHighlight=true&q=degas'

'https://collectionapi.metmuseum.org/public/collection/v1/search?medium=Quilts|Silk|Bedcovers&q=quilt'
'https://collectionapi.metmuseum.org/public/collection/v1/search?isOnView=true&q=sunflower'
'https://collectionapi.metmuseum.org/public/collection/v1/search?isOnView&q=modern'
'https://collectionapi.metmuseum.org/public/collection/v1/search?isOnView=true&q=cat'
'https://collectionapi.metmuseum.org/public/collection/v1/search?isHighlight=true&q=cat
'
    url = "https://collectionapi.metmuseum.org/public/collection/v1/search?departmentId=21&q=modern%20arts"
    unparsed_data = RestClient.get(url)
    parsed_data = JSON.parse(unparsed_data)
    obj_arr = parsed_data["objectIDs"]

    obj_arr.each do |object|
    url = "https://collectionapi.metmuseum.org/public/collection/v1/objects/#{object}"
    unparsed_url = RestClient.get(url)
    parsed_url = JSON.parse(unparsed_url)

        artist = find_artist(parsed_url["artistDisplayName"])
        if artist.save
            artist.bio = parsed_url["artistDisplayBio"]
        end
        arr = [true,false]
        artwork = Artwork.create(
        title: parsed_url["title"], #need to remove unneeded characters w/regex
        img_url: parsed_url["primaryImage"],
        artist: artist,
        price: rand(25000..10000000),
        user: User.all.sample,
        object_type: find_object(parsed_url["objectName"]),
        for_sale: arr.sample
        )
    
    


    

end 

puts Artwork.count