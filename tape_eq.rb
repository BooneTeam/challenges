require 'pry'
# A non-empty zero-indexed array A consisting of N integers is given. Array A represents numbers on a tape.
#
#     Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].
#
#     The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|
#
#     In other words, it is the absolute difference between the sum of the first part and the sum of the second part.
#
#     For example, consider array A such that:
#
# A[0] = 3
# A[1] = 1
# A[2] = 2
# A[3] = 4
# A[4] = 3
# We can split this tape in four places:
#
# P = 1, difference = |3 − 10| = 7
# P = 2, difference = |4 − 9| = 5
# P = 3, difference = |6 − 7| = 1
# P = 4, difference = |10 − 3| = 7
# Write a function:
#
#             def solution(a)
#
#               that, given a non-empty zero-indexed array A of N integers, returns the minimal difference that can be achieved.
#
#                   For example, given:
#
#               A[0] = 3
#               A[1] = 1
#               A[2] = 2
#               A[3] = 4
#               A[4] = 3
#               the function should return 1, as explained above.
#
#                   Assume that:
#
#                              N is an integer within the range [2..100,000];
#               each element of array A is an integer within the range [−1,000..1,000].
#                   Complexity:
#
#                   expected worst-case time complexity is O(N);
#               expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
#                   Elements of input arrays can be modified.
# keep track of left val as iterating over to right val

# if youve got something use it. watch out for edge case

def solution(array)
  front = array[0]
  back = array[1..-1].inject { |sum, nxt| sum += nxt }
  array.each_with_index do |n, idx|
    if idx+1 != array.length
      subtracted = (front - back).abs
      if array[idx+1]
        front += array[idx+1]
        back -= array[idx+1]
      end
      return @smallest = 0 if subtracted == 0
      @smallest ||= subtracted
      if subtracted < @smallest
        @smallest = subtracted
      end
    end
  end
  @smallest
  # first = [0..array.length-1]
  # second = [array.length-1..-1]
  # do_it(first,second)

  # (array.length-1).times do |n|
  #   first   =  array[0..n]
  #   second  = array[n+1..-1]
  #   first_t  = first.inject(0){|sum,nxt| sum += nxt }
  #   second_t = second.inject(0){|sum,nxt| sum += nxt }
  #   total   = (first_t - second_t).abs
  #   return 0 if total == 0
  #   @smallest ||= total
  #   if total < @smallest
  #     @first_t = first_t
  #     @second_t = second_t
  #     @smallest = total
  #   end
  # end
  # p @first_t
  # p @second_t
  # p @smallest
end

#
# p  solution([-1000,1000])
# 2000
# p solution([-10, -5, -3, -4, -5])
# 3
# p solution([-10, -20, -30, -40, 100])
# 20
# p solution([3,1,2,4,3])
# 1
p solution(Array(1..10000))
# 1221 or sometjhing