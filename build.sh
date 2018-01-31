

if [ ! -d "../abp-filter-parser" ]; then

    echo
    echo "ERROR: abp-filter-parser repo not found in the parent directory"
    echo 
    exit 1

fi

if [ ! -d "../bloom-filter-js" ]; then

    echo
    echo "ERROR: bloom-filter-js repo not found in the parent directory"
    echo
    exit 1

fi


webpackcmd=./node_modules/webpack/bin/webpack.js
babelcmd=./node_modules/.bin/babel

rm -rf build/
mkdir build/

npm update

# this builds a standalone version of abp-filter-parser and bloom-filter-js 
$webpackcmd --config webpack-abp-filter-parser.config.js
$webpackcmd --config webpack-bloom-filter.config.js

# all the following builds an es2015 compatible version 

echo "require('babel-polyfill');" > build/abp-filter-parser.js
cat ../abp-filter-parser/src/abp-filter-parser.js >> build/abp-filter-parser.js
cp ../abp-filter-parser/src/badFingerprints.js build/

$webpackcmd --config webpack-abp-filter-parser.config-es2015.js
cat build/abp-filter-parser-packed.js | $babelcmd --presets es2015 > src/abp-filter-parser-packed-es2015.js

cat src/bloom-filter-packed.js | $babelcmd --presets es2015 > src/bloom-filter-packed-es2015.js

