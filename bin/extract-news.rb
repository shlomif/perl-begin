date=ARGV.shift
$s = ''
extract1 = false
extract2 = false
finish = false
IO.foreach('src/news/index.html.wml') do |l|
    if finish
        nil # do nothing.
    elsif (l =~ /#{date}/)
        extract1 = true
    elsif extract2 then
        if (l =~ /^<h2/)
            finish = true
        else
            l.gsub(/$\(ROOT\)/, 'http://perl-begin.org/');
            $s += l
        end
    elsif extract1 then
        if (l =~ /<\/h2/)
            extract2 = true
        end
    end
end

print $s
