#!/bin/sh

# Mardi 02 février 2016

# repris de celui de courant/ pour mon site perso. Toute dernière mouture qui
# doit marcher sur Mac OS et sur GNU/Linux malgré les stat et touch
# différents.

# Samedi 17 décembre 2016

# encore un converti à l'emploi de `git ls-files`.

# 2 juin 2025, /usr/bin/stat pour utiliser le stat du macOS et pas le GNU stat
case `uname -s` in
    "Linux" )
        MYDATEFORTOUCH() {
            date -d"$(stat -c %y "$1")" +%Y%m%d%H%M.%S
        }
        ;;
    "Darwin" )
        MYDATEFORTOUCH() {
            /usr/bin/stat -f %Sm -t %Y%m%d%H%M.%S "$1"
        }
        ;;
    * )
        MYDATEFORTOUCH() {
            197001010000.00
        }
        ;;
esac

echo "#!/bin/sh" > .resettimestamps.sh

IFS='
'

for file in `git ls-files`
do
    [ "$file" != ".resettimestamps.sh" ] && \
	echo "touch -ch -t $(MYDATEFORTOUCH "$file") \"$file\"" >> .resettimestamps.sh
done

chmod u+x .resettimestamps.sh
