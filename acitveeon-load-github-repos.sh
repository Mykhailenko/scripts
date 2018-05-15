#!/usr/bin/env bash

declare -a names=("Gleb"          "Justine" "Brian"   "Fabien"    "Marco"         "Paraita" "Vincent" "Yaro"              "Pedro"         "Mael")

declare -a logins=("Mykhailenko"   "jrochas" "bamedro" "fviale"    "marcocast"     "paraita" "vinseon" "ShatalovYaroslav"  "pedrovelho"    "MaelAudren")

declare -a repos=("scheduling" "scheduling-portal" "scheduling-api" "studio" "documentatio" "jsr223-scala" "programming")

currentDir=$(pwd)

function loadRepo {
    nameOfRepo="$1"

    cd ..
    git clone http://github.com/ow2-proactive/$nameOfRepo


    cd $nameOfRepo

    for i in $(seq 1 ${#names[@]})
    do
        let "index=i-1"
        name=${names[index]}
        login=${logins[index]}

        git remote add $name http://github.com/$login/$nameOfRepo
    done

    cd $currentDir
}


if [ "$#" -eq 1 ] ; then
    loadRepo $1
else
    for nameOfRepo in "${repos[@]}"
    do
        loadRepo $nameOfRepo
    done
fi



