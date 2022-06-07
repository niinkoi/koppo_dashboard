module DashboardApiHelper
  def remove_nil_params(hash)
    hash.compact
  end

  def required_params(params, *expected_params)
    expected_params.each_with_object({}) do |param, result|
      raise ArgumentError, "Missing required parameter '#{param}'" unless params.key? param

      result[param] = params[param]
      result
    end
  end

  def required_and_not_blank(params, *keys)
    keys.each_with_object({}) do |key, result|
      raise ArgumentError, "Missing required parameter '#{key}'" if params[key].blank?

      result[key] = params[key]
      result
    end
  end

  def tolerate_nil_params(params, *expected_params)
    expected_params.each_with_object({}) do |param, result|
      raise ArgumentError unless params.key?(param)

      result[param] = params[param]
      result
    end
  end

  def render_error(status_code, errors)
    render status: status_code, json: { errors: [errors].flatten }
  end
end
