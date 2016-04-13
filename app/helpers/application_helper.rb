module ApplicationHelper
    # Helper to determine whether
    # current path is active.
    # Look at application.html.haml for example usage.
    def active(path)
      "active" if current_page?(path)
    end

    def active_class?(*paths)
      active = false
      paths.each { |path| active ||= current_page?(path) }
      active ? 'active' : nil
    end
end
