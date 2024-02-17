#!/bin/bash
# interrupt on error
set -e

# const
host="marketplace.visualstudio.com"
galleryApi="_apis/public/gallery"

# vars
download=""

# functions
function _help {
    echo "vscev - VSCode Extension Version Checker"
    echo "Usage: vscev [option] [extensionID]"
    echo "Options:"
    echo "  -d  Download the extension"
    echo "  -h  Show help"
}

function _raise {
    echo -e "Error: $1"
    exit 1
}

# get opts
while getopts dh option
do
    case "${option}"
    in
    d) download="true";;
    h) _help; exit 0;;
    \?) _help; _raise "Invalid option";;
    esac
done
shift $((OPTIND-1))
extid=$1

# validate
if [ -z $extid ]; then
    _help
    _raise "extensionID is required"
fi

# main
publisher=$(echo $extid | cut -d'.' -f1)
extName=$(echo $extid | cut -d'.' -f2)

# Get the latest version
# TODO: to add error handling
# TODO: to enable step-by-step debug
# TODO: to enhance html parser
version=$(curl -fsL https://${host}/items?itemName=${extid} \
    | grep -o '"version":.*,' -m 1 \
    | cut -d',' -f1 \
    | cut -d':' -f2 \
    | sed -e 's/"//g'
)

if [ -z "${download}" ]; then
    if [ -z "${version}" ]; then
        _raise "Failed to get the latest version of ${extid}"
    fi
    # TODO: to validate the version
    echo $version
else
    echo "Downloading ${extid}@${version}..."
    url="${host}/${galleryApi}/publishers/${publisher}/vsextensions/${extName}/${version}/vspackage"
    url=https://$(sed -e 's // / g' <<< $url)
    curl -fsL -o ${extid}-${version}.vsix $url || _raise "Failed to download\nRun \"curl ${url}\" for more information."
    echo "Saved as ${extid}-${version}.vsix"
fi
