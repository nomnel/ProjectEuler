def e014
  @memo = {1 => 1}

  def chain_length(n)
    if @memo[n] != nil
      @memo[n]
    else
      @memo[n] = chain_length(n.even? ? (n / 2) : (3 * n + 1)) + 1
    end
  end

  (1..1000000).inject{|p, n| chain_length(p) > chain_length(n) ? p : n}
end