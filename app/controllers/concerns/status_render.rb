module StatusRender
  extend ActiveSupport::Concern
  included do
    include ActiveSupport::Rescuable
    rescue_from ActiveModel::UnknownAttributeError, with: :render_invalid_parameters
  end

  def render_success(body, status=200, options={})
    options.merge!(json: body, status: status)
    render options
  end

  def render_error(body, status=500, options={})
    options.merge!(json: body, status: status)
    render options
  end

  def render_invalid_parameters(exception)
    render_error(exception, 403)
  end
end
