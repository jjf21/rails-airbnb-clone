class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @products = Product.first(4)
    content = 'Lots of people are unaware of the fact that adult acne exists and they seem not to know how to treat adult acne.'
    @services = [
                {icon: 'fa-eye', title: 'Cherchez un mannequin', content: content},
                {icon: 'fa-heart', title: 'Tomber amoureux', content: content},
                {icon: 'fa-female', title: 'Entretenez une relation professionnelle', content: content},
                {icon: 'fa-venus-mars', title: 'Trouvez votre match', content: content}
                ]
  
    @skills = Skill.all

  end
end
