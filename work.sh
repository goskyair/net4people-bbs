#!/usr/bin/env bash
monitor_and_kill() {
    local found=0
    
    while read line; do
        echo "$line"
        
        if [[ "$line" == *'4900/5000'* ]]; then
            found=1
            (   echo 'include 5000/5000 kill script'
                pkill 'python ./backup.py -u' || pkill python || pkill -9 python
            ) &
            break
        elif [[ "$line" == *'5000/5000'* ]]; then
            found=1
            (   echo 'include 5000/5000 kill script'
                pkill 'python ./backup.py -u' || pkill python || pkill -9 python
            ) &
            break
        fi
    done
    return 0
}
python ./backup.py -u "$1" "$2" "$3" | monitor_and_kill
exit 0