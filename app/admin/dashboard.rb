# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  # menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  # content title: proc { I18n.t("active_admin.dashboard") } do
  #   div class: "blank_slate_container", id: "dashboard_default_message" do
  #     span class: "blank_slate" do
  #       span I18n.t("active_admin.dashboard_welcome.welcome")
  #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #     end
  #   end

  #   # Here is an example of a simple dashboard with columns and panels.
  #   #
  #   # columns do
  #   #   column do
  #   #     panel "Recent Posts" do
  #   #       ul do
  #   #         Post.recent(5).map do |post|
  #   #           li link_to(post.title, admin_post_path(post))
  #   #         end
  #   #       end
  #   #     end
  #   #   end

  #   #   column do
  #   #     panel "Info" do
  #   #       para "Welcome to ActiveAdmin."
  #   #     end
  #   #   end
  #   # end


  # end # content

  content do
    columns do
      column do
        panel "Recent Events" do
          ul do
            Event.order('created_at asc').limit(10).map do |event|
              li link_to(event.title.capitalize, admin_event_path(event))
            end
          end
        end
      end

      column do
        panel "Categories" do
          ul do
            Category.order('created_at desc').limit(5).map do |category|
              li link_to(category.name.capitalize, admin_category_path(category))
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Users Statistics" do
          div do
            "Total Users: #{User.count}"
          end
          div do
            "Organizers: #{User.where(role: 'organizer').count}"
          end
          div do
            "Attendees: #{User.where(role: 'attendee').count}"
          end
        end
      end

      column do
        panel "Event Statistics" do
          div do
            "Total Events: #{Event.count}"
          end
          div do
            "Upcoming Events: #{Event.where('start_time > ?', Time.now).count}"
          end
          div do
            "Past Events: #{Event.where('end_time < ?', Time.now).count}"
          end
        end
      end
    end
  end
end
