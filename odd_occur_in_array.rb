require 'pry'

def solution(a)
  return a.first if a.length <= 1
  a.sort!
  n = 0
  x = 1
  (a.length).times do |asdf|
    return a[n] if a[n] != a[x]
    n+=2
    x+=2
  end
end

p solution([2, 2, 3, 3, 4])