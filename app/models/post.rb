class Post < ApplicationRecord
 belongs_to :user
 validates :title, presence: true, length: { minimum: 5, maximum: 255 }
 validates :content, presence: true, length: { minimum: 20, maximum: 1000 }

 def self.searchbycategory(category)
       if category
             Post.where('category LIKE ?',"%#{category}%")
       else
             Post.all
       end
   end
   def self.searchbytitle(title)
         if title
               Post.where('title LIKE ?',"%#{title}%")
         else
               Post.all
         end
     end
end
