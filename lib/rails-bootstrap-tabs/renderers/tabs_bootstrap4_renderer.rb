module RailsBootstrapTabs::Renderers
  class TabsBootstrap4Renderer < TabsRenderer
    def render_tabs_wrapper
      content_tag :ul, class: 'nav nav-tabs nav-justified', role: 'tablist' do
        yield
      end
    end

    def render_tab(tab)
      options = tab.options
      link_class = 'nav-link'
      link_class << ' active' if options[:active]
      area_selected = (options[:active])? 'true' : 'false'
      content_tag :li, class: 'nav-item' do
        link_to "##{options[:anchor]}", data: { toggle: 'tab' }, class: link_class, role: 'tab', 'area_selected': area_selected do
          yield
        end
      end
    end

    def render_panes_wrapper(options)
      content_class = 'tab-content'
      content_class << " #{options[:content_class]}" if options[:content_class]

      content_tag :div, class: content_class do
        yield
      end
    end

    def render_pane(tab)
      options = tab.options
      pane_class = 'tab-pane'
      pane_class << ' active' if options[:active]
      if options[:fade_effect]
        pane_class << ' fade'
        pane_class << ' show' if options[:active]
        pane_class << ' in' unless options[:active]
      end
      content_tag :div, id: options[:anchor].to_s, class: pane_class, role: 'tabpanel' do
        yield
      end
    end
  end
end
