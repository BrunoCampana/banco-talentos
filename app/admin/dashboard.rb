ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Painel de Controle" #proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    render :partial => 'painelcontrole/dashboard/dashboard'




    #div class: "blank_slate_container", id: "dashboard_default_message" do
      #span class: "blank_slate" do
        #span I18n.t("active_admin.dashboard_welcome.welcome")
        #small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #     para "Existem " + Talento.count().to_s + " talentos cadastrados \n"
    #     para "Existem " + AdminUser.where(tipo: "Recrutador").count().to_s + " recrutadores cadastrados \n"
    #     para "Existem " + Quartel.where(tipo: "Empresa").count().to_s + " empresas cadastradas \n"
    #     para ENV["AVISO_CONT"]
    #     para ENV["AVISO_OM"]
    #     para ENV["AVISO_RECRUTADOR"]
    #
    #     columns do
    #       column max_width: "3000px", min_width: "100px", max_height: "100px", min_height: "100px" do
    #         div "Column # 1"
    #       end
    #       column max_width: "3000px", min_width: "100px", max_height: "100px", min_height: "100px" do
    #         div "Column # 2"
    #       end
    #       column max_width: "3000px", min_width: "100px", max_height: "100px", min_height: "100px" do
    #         div "Column # 3"
    #       end
    #     end
    #
    #
    #     columns do
    #       column max_width: "3000px", min_width: "100px", max_height: "100px", min_height: "100px" do
    #         div "Column # 4"
    #       end
    #       column max_width: "3000px", min_width: "100px", max_height: "100px", min_height: "100px" do
    #         div "Column # 5"
    #       end
    #       column max_width: "3000px", min_width: "100px", max_height: "100px", min_height: "100px" do
    #         div "Column # 6"
    #       end
    #     end
    #
    #   end
    # end





  end


    # Here is an example of a simple dashboard with columns and panels.
    #
    #columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  #end # content
end
