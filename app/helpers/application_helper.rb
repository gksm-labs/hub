module ApplicationHelper
  def flash_class_for(type)
    base_classes = "pointer-events-auto flex items-center gap-3 p-4 rounded-xl shadow-lg border text-sm font-medium transition-all duration-300 transform translate-x-0 opacity-100 max-w-sm w-full"

    type_classes = case type.to_s
    when "notice", "success"
                     "bg-white border-green-200 text-slate-800 border-l-4 border-l-green-500"
    when "alert", "error"
                     "bg-white border-red-200 text-slate-800 border-l-4 border-l-red-500"
    else
                     "bg-white border-slate-200 text-slate-800 border-l-4 border-l-slate-500"
    end

    "#{base_classes} #{type_classes}"
  end

  def flash_icon_for(type)
    icon = case type.to_s
    when "notice", "success"
             '<svg class="w-6 h-6 text-green-500 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/></svg>'
    when "alert", "error"
             '<svg class="w-6 h-6 text-red-500 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>'
    else
             '<svg class="w-6 h-6 text-slate-500 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>'
    end

    icon.html_safe
  end
end
