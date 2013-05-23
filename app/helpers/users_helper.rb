module UsersHelper

  def user_status(user)
    if user.logged_in
      if user.last_request_at > 5.minutes.ago
        image_tag("online.png")
      elsif user.last_request_at > 20.minutes.ago
        image_tag("away.png")
      else
        image_tag("offline.png")
      end
    else
      image_tag("offline.png")
    end
  end

  def find_active_users
    User.all.select{|u| (u.logged_in && u.last_request_at > 20.minutes.ago) }.count
  end
end
