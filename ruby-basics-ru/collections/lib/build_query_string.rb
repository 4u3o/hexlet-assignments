# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(params)
  params.sort_by { |k, _| k }.each_with_object([]) do |(k, v), acc|
    acc << "#{k}=#{v}"
  end.join('&')
end
# END
# rubocop:enable Style/For
