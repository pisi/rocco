rootdir = File.dirname(File.dirname(__FILE__))
$LOAD_PATH.unshift "#{rootdir}/lib"

require 'test/unit'
begin; require 'turn'; rescue LoadError; end
begin
    require 'rdiscount'
rescue LoadError
    if !defined?(Gem)
        require 'rubygems'
        retry
    end
end
require 'rocco'

def roccoize( filename, contents, options = {} )
    Rocco.new( filename, [ filename ], options ) {
        contents
    }
end

# Send STDERR into the void to suppress program output messages
STDERR.reopen(test(?e, '/dev/null') ? '/dev/null' : 'NUL:')
