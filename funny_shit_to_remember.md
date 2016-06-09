# lolcommits [https://github.com/mroth/lolcommits](https://github.com/mroth/lolcommits)
- LolCommit images are stored in ~/.lolcommits
- Easily make a timelapse like so: `convert `find . -type f -name "*.jpg" -print0 | xargs -0 ls -tlr | awk '{print $9}'` timelapse.mpeg`
