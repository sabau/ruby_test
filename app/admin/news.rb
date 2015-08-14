ActiveAdmin.register News do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :date, product_ids: []

  form do |f|
    panel 'News body' do
      f.inputs do
        f.input :title
        f.input :date
        f.input :description
      end
    end

    f.inputs do
      f.input :products, as: :check_boxes
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :date
      row :description
      row :products do |p|
        raw news.products.map{ |p| p.title }.join('<br>')
      end
    end
    active_admin_comments
  end

end
