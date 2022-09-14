module ApplicationHelper
    include Pagy::Frontend
    
    def user_name_or_email(user)
        if user.name.present?
            user.name
        else
            user.email.split('@')[0]
        end
    end

    def nav_tab(title, url, options = {})
        current_page = options[:current_page]

        css_class = current_page == title ? 'text-secondary': 'text-white'

        options[:class] =   if options[:class]
                                options[:class] + ' ' + css_class
                            else
                                css_class
                            end

        link_to title, url, options                        
    end

    def currently_at(current_page = "")
        render partial: 'shared/menu', locals: {current_page: current_page}
    end

    def full_title page_title = "" 
        base_title = "AskIt"
        if page_title.present? 
            "#{base_title} | #{page_title}"
        else
            base_title
        end
    end
end
