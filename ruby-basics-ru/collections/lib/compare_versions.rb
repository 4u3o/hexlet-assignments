# frozen_string_literal: true

# BEGIN
def compare_versions(ver1, ver2)
  return 0 if ver1 == ver2

  v1_arr = ver1.split('.').map(&:to_i)
  v2_arr = ver2.split('.').map(&:to_i)

  v1_arr.each_with_index do |num, idx|
    return 1 if v2_arr[idx].nil? || num > v2_arr[idx]
    return -1 if num < v2_arr[idx]
  end
end
# END
