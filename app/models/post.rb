class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary,length: {maximum: 250}
    validates :category, inclusion: {in:["Fiction","Non-Fiction"]}  #In has an alias called within and takes any enumarable object.i.e hash, array e.t.c
    validate  :sufficiently_clickbait   #This is a cutome validation and is run at the end

    #Custom validations
    def sufficiently_clickbait
        if ["Won't Believe","Secret","Top[number]","Guess"].none? {|string| title.includes?(string)}
           error.add(:title, "Title is not sufficiently Click-baity.").#The error will be added in the error hash with the key value  pairs if the validation fails
        end
    end

end
