require 'pry'
# Write a function:

# def solution(a)

# that, given a non-empty zero-indexed array A of N integers, returns the minimal positive integer (greater than 0) that does not occur in A.

# For example, given:

#         A[0] = 1
# A[1] = 3
# A[2] = 6
# A[3] = 4
# A[4] = 1
# A[5] = 2
# the function should return 5.

# Assume that:

#                N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
#     Complexity:

#     expected worst-case time complexity is O(N);
# expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).

def solution(array)
  array.sort!.uniq!
  return 1 if array.length == 1 && (array.first == 0 || array.first == 2)
  return 2 if array.length == 1 && array.first == 1
  length = array.length
  negatives = 0
  length.times do |n|
    if array[n] <= 0
      negatives +=1
      next
    else
      @supposed = (negatives >= 0 ? (n + 1 -negatives) : (n + 1))
      if array[n] != @supposed
        return @supposed
      end
    end
  end
  @supposed.nil? ?  1 : @supposed + 1
end

# p solution([-1, -2, 1, 2, 3, 4, 6])
# p solution([2])
# p solution([1])
# p solution([1,3,6,4,1,2])
# p solution([0,1, 2, 3, 4,5,6,7])
# p solution(Array(-100..-1))
