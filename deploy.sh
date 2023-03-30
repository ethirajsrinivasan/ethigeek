rake db:seed:dump
cd ../ethirajsrinivasan.github.io
wget -k -K  -E -r -l 10 -p -N -F --restrict-file-names=windows -nH http://localhost:3000
git add .
git commit 	-m $1
ggpush 
cd ../ethigeek
rake sitemap:refresh