module ApplicationHelper

  def tailwind_classes_for(flash_type)
    {
      success: "bg-yellow-400 border-l-4 border-yellow-500 text-black",
      notice: "bg-yellow-400 border-l-4 border-yellow-500 text-black",
      alert: "bg-red-400 border-l-4 border-red-700 text-black"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
