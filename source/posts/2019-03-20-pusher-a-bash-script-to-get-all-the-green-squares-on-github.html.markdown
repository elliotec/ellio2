---

title: Pusher - A Bash script to get all the green squares on Github
date: 2019-03-20 14:52 MDT
tags: bash, script, github
published: true

---

## Get that green

<img src="/images/pusher.png" alt="green squares"/>
_Heh, 4,303 contributions? Yeah..._

I remember when first starting out in development, people would tell me that hiring managers and recruiters _really cared_ about those little green contribution squares on Github. It shows how active you are, they said. The more squares you have the better, they told me.

At first I believed them and genuinely tried to commit code near-daily to make sure my public image at least seemed prolific enough to be noticed. Pretty quickly I realized how easily this could be automated. I didn't think much about how to do that yet, and it felt a bit dirty, especially when I was looking for my first dev job.

With a bit more experience and a few fewer shits to give, I figured I'd give it a shot for a little scripting practice and fun.

## Pusher

The first thing I needed was some content to actually commit. The obvious choice was Unix's [`fortune`](https://en.wikipedia.org/wiki/Fortune_(Unix)), which generates a psuedorandom quote based on parameters you give it. I used shorter fortunes for commit messages and longer ones for the file contents.

Then I needed to write the script to automatically generate the files based on the fortunes, commit a random number of changes daily (for the different shades of green on the squares), and push them to a Github repo. Nothing a tiny bash script and cron job can't handle.

There are 6 files involved in this:

1. `README.md` - totally unnecessary. I just use it as a disclaimer to make it clear I'm bullshitting.

2. `.gitignore` - absolutely essential to ignore the file which contains your Github credentials, in my case `push.sh`

3. `file.txt` - the only file that ever changes, contents are replaced by the fortune command on each commit.

4. `committed.sh` - the file that generates the fortunes, replaces the contents of `file.txt`, and commits up to [23](https://en.wikipedia.org/wiki/23_enigma) (but no fewer than 1) changes.

```sh
#!/bin/bash
NUMBER=$(($RANDOM % 23))

for ((run=1; run <= NUMBER + 1; run++))
do
  echo `/usr/games/fortune` > ~/pusher/file.txt
  /usr/bin/git -C ~/pusher/ add . -A
  /usr/bin/git -C ~/pusher/ commit -m "`/usr/games/fortune -sn 32`"
done
```

5. `push.sh` - the file that runs the `commited` script and pushes to Github with your credentials. **Do not commit this file.**

```sh
#!/bin/bash
bash ~/pusher/committed.sh
/usr/bin/git -C ~/pusher push -u https://{MY_GITHUB_USERNAME}:{MY_GITHUB_PASSWORD}@github.com/{MY_GITHUB_USERNAME}/pusher.git master
```

6. `cron.txt` - this is a reference file for the actual cron job run by my server which you can edit in a Unix environment with `crontab -e`. Look up how to write cron jobs, I have mine running at 4:20pm every day, because you know, blaze it etc.

```crontab
20 16 * * * bash ~/pusher/push.sh
```
That's it. Super tiny, totally works, totally tricked a recruiter or two maybe.

[Here's the repo for reference.](https://github.com/elliotec/pusher)


