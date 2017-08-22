helpers do

  def current_user
    @user = User.find(params[:id]) if params[:id]
  end

  #To avoid "failing hard", user find_by instead:
  # ex: User.find_by(id: params[:id])
  #"find_by" is also how you find a user by email or anything other than id
  #ex: User.find_by(email: params[:email])
  #"find_by" can search by multiple criteria
  #Ex: User.find_by(email: params[:email], name: params[:name])

  def logged_in?
    !!current_user
  end
  # !! changes current_user form a user object into a True/False
  #Without current_user method, would be written "!!params[:id]"

  def authenticate!
    redirect '/sessions/new' unless logged_in?
  end
  #This is for checking someone is logged in, for content only available to people logged in



end


# Can write a helper for authorized?(authorized_user)
  # if authorized_user != current_user
  # Redirect to "unauthorized 400 page"

  #Alternatively, just write the logic on line 31 on the controller page

  # authenticate!
  # if user authorized_user.id == current_user.id
  #   blah blah blah
  # else

  #   <% if current_user && authorized_user.id == current_user.id %>
  #     <a href="/posts/update">Update Comment</a>
  #   <% end %>

