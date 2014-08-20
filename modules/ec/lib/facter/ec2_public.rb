Facter.add("ec2_public") do
        setcode do
                %x{ec2metadata --public-hostname}.chomp
        end
end

Facter.add("ec2_ip") do
        setcode do
                %x{ec2metadata --public-ipv4}.chomp
        end
end
