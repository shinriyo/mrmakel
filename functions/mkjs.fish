function mkjs
    # check argument
    if count $argv > /dev/null
    else
        echo 'Please input file name for argument.'
        return
    end

    # check file exists
    if test -e './'$argv'.js'
        echo -sn './'$argv'.js already exists. Continue to override? [Y/n] ' > /dev/stderr
        __fisher_get_key | read -l yn
        echo $yn
        switch "$yn"
            case n N
            return 1
        end
    end

    # create javascript
    string trim 'var '$argv' = function() {
}' > ./$argv.js
    echo './'$argv'.js file was created.'
end
