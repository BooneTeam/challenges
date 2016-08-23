# A small frog wants to get to the other side of a river. The frog is currently located at position 0, and wants to get to position X. Leaves fall from a tree onto the surface of the river.
#
#     You are given a non-empty zero-indexed array A consisting of N integers representing the falling leaves. A[K] represents the position where one leaf falls at time K, measured in seconds.
#
#     The goal is to find the earliest time when the frog can jump to the other side of the river. The frog can cross only when leaves appear at every position across the river from 1 to X. You may assume that the speed of the current in the river is negligibly small, i.e. the leaves do not change their positions once they fall in the river.
#
#     For example, you are given integer X = 5 and array A such that:
#
#                                                                   A[0] = 1
# A[1] = 3
# A[2] = 1
# A[3] = 4
# A[4] = 2
# A[5] = 3
# A[6] = 5
# A[7] = 4
# In second 6, a leaf falls into position 5. This is the earliest time when leaves appear in every position across the river.
#
#     Write a function:
#
#                 def solution(x, a)
#
#                   that, given a non-empty zero-indexed array A consisting of N integers and integer X, returns the earliest time when the frog can jump to the other side of the river.
#
#                       If the frog is never able to jump to the other side of the river, the function should return −1.
#
#                       For example, given X = 5 and array A such that:
#
#                                                                     A[0] = 1
#                   A[1] = 3
#                   A[2] = 1
#                   A[3] = 4
#                   A[4] = 2
#                   A[5] = 3
#                   A[6] = 5
#                   A[7] = 4
#                   the function should return 6, as explained above.
#
#                       Assume that:
#
#                                  N and X are integers within the range [1..100,000];
#                   each element of array A is an integer within the range [1..X].
#                       Complexity:
#
#                       expected worst-case time complexity is O(N);
#                   expected worst-case space complexity is O(X), beyond input storage (not counting the storage required for input arguments).
#
# pond doesn't move so you just need all elements and last found index?
# find earliest spot that all numbers exist?

require 'pry'
def solution(width, array)
  spots = Array(1..width)
  uniq = array.uniq
  missing = spots - uniq
  return -1 if missing.length >= 1
  return 0 if array.length == 1
  found2 = {}
  array.length.times do |idx|
    if found2.length == uniq.length
      return found2.to_a.last[1]
    elsif found2[array[idx]].nil?
      found2[array[idx]] = idx
    end
  end
  found2.to_a.last[1]
end


p solution(1,[1])