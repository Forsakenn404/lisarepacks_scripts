#!/system/bin/sh
workdir='/storage/emulated/0/Android/data'
list_games=($(ls -d ${workdir}/in.lisarepacks.*))

# list game
echo
echo '- List Games:'
for games in ${list_games[@]}; do basename $games; done

# Restore files
echo
echo '- Restore save file:'
for games in ${list_games[@]}; do
    dir="${workdir}/backup.lisarepacks/$(basename $games)"
    cp -pfr $dir/* $games/files/
    echo "...[Restore OK] for $games"
done 

echo
echo
echo '-- End --'
exit 0
