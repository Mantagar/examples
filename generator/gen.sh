#!/bin/bash

random_item() {
    local array=($@)
    local length=${#array[@]}
    local index=$(( $RANDOM % $length ))
    local item="${array[$index]}"
    echo "$item"
}

repeat_spaces() {
    local length=$1
    local word=$2
    length=$(( $length - ${#word} ))
    local separator=''
    while [[ $length -gt 0 ]]; do
        separator="$separator "
        length=$(( $length - 1 ))
    done
    echo "$separator"
}

separate_words() {
    local output=''
    output="$1 $(repeat_spaces 8 $1)"
    output="$output $2 $(repeat_spaces 9 $2)"
    output="$output $3 $(repeat_spaces 5 $3)"
    output="$output $4 $(repeat_spaces 10 $4)"
    output="$output $5 $(repeat_spaces 12 $5)"
    echo "$output"
}

_names=(
John Bob Jeremiah Edgar
Felix Susan Annie Luna
Harry Ronald Hannah Sara
Fiona Clara Victor Paul
Joe Hans Stanley Aubrey
)

_surnames=(
Gray Johnes Carter Twain
Potter Stone Cavil Drake
Swan Goose Jew Ham Kowalsky
Mendez Oldman Redmane Riedel
Sanchez Phillips Lawrence
)

_jobs=(
doctor teacher officer nurse
programmer judge cook merchant
unemployed athlete driver official
tailor baker barberer singer actor
)

_hobbies=(
computers television sports
knitting smoking drugs drinking
firearms fashion hazard religion
)

_tags=(NAME SURNAME AGE JOB HOBBY)

echo -e "\033[31;1m$(separate_words ${_tags[@]})\033[0m"
for i in $(seq 0 $(( $1 - 1 ))); do
    name=$(random_item ${_names[@]})
    surname=$(random_item ${_surnames[@]})
    age=$(( $RANDOM % 60 + 18 ))
    job=$(random_item ${_jobs[@]})
    hobby="$(random_item ${_hobbies[@]})"
    echo "$(separate_words $name $surname $age $job $hobby)"
done
