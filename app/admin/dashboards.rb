ActiveAdmin::Dashboards.build do
  section "Recent Videos", :priority => 1 do
    table_for Video.order("created_at desc").limit(5) do
      column :title do |v|
        link_to v.title, [:admin, v]
      end
      column :category
      column :views
      column :likes, :sortable => "likes.count" do |video|
        video.likes.count.to_s
      end
      column :provider
    end
    strong { link_to "View All Videos", admin_videos_path }
  end
  
  section "Recent Users", :priority => 2 do
    table_for User.order("created_at desc").limit(5) do
      column :username do |u|
        link_to u.username, [:admin, u]
      end
      column :email
    end
    strong { link_to "View All Users", admin_users_path }
  end
  
  section "Recent Help Tickets" do
    table_for Help.order("created_at desc").limit(5) do
      column("Status") { |ticket| status_tag(ticket.status) }
      column("Name")   { |h| link_to h.name, [:admin, h]    }
      column :email
    end
    strong { link_to "View All Help Tickets", admin_helps_path }
  end
end
