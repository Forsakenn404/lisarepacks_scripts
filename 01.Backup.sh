#!/system/bin/sh
workdir='/storage/emulated/0/Android/data'
list_games=($(ls -d ${workdir}/in.lisarepacks.*))

# list game
echo
echo '- List Games:'
for games in ${list_games[@]}; do basename $games; done

# Backup files
echo
echo '- Generate backup save file:'
for games in ${list_games[@]}; do
    dir="${workdir}/backup.lisarepacks/$(basename $games)"
    mkdir -p $dir
    rm -rf $dir/*
    cp -pr $games/files/saves $dir/
    echo "...[backup OK] for $games"
done 

echo
echo
echo '-- End --'
exit 0
