function md5_file_verify
    if test (md5 $argv[1] | cut -f 2 -d "=" | sed 's/ *//') != $argv[2];
        echo "md5 NOT VERIFIED"; and return 1;
    end
end
