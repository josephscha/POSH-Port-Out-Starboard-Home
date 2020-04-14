# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.destroy_all
Artwork.destroy_all
ObjectType.destroy_all
User.destroy_all

require 'byebug'
require 'rest-client'
require 'json'

User.create(name: "greg")

objects_array = [437133]

def find_artist(name)
    Artist.find_or_create_by(name: name)
end


def find_object(name)
    ObjectType.find_or_create_by(name: name)
end

    url = "https://collectionapi.metmuseum.org/public/collection/v1/search?departmentId=19&q=cat"
    unparsed_data = RestClient.get(url)
    parsed_data = JSON.parse(unparsed_data)
    cats_obj_arr = parsed_data["objectIDs"]

cats_obj_arr.each do |object|
    url = "https://collectionapi.metmuseum.org/public/collection/v1/objects/#{object}"
    unparsed_url = RestClient.get(url)
    parsed_url = JSON.parse(unparsed_url)

        artist = find_artist(parsed_url["artistDisplayName"])
        if artist.save
            artist.bio = parsed_url["artistDisplayBio"]
        end
        
        Artwork.create(
        title: parsed_url["title"],
        img_url: parsed_url["primaryImage"],
        artist: artist,
        price: rand(25000..10000000),
        user: User.all.sample,
        object_type: find_object(parsed_url["objectName"])
    )


    

end 