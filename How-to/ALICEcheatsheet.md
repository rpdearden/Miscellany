**ALICE CHEAT SHEET**

**Reminders for how to do things with Linux on the UoL ALICE cluster**
***
I have set up ALICE to be accessed via MobaXterm using ssh keys. Middle mouse button is paste.
***
**Look at modules**
```
module spider
```

**look at currently loaded modules**
```
module list
```

**look at partitions**
```
sinfo
```

**look at queue**
```
squeue
```

**Look at your job in queue**
```
squeue --start -u <username>
```

**Look at job resources**
```
seff <job ID>
```

**Look at job resources**
```
seff <job ID>
```

**Cancel job**
```
scancel <job ID>
```

**Look at max. memory resources used for job**
```
sacct -j <job ID> -o "JobID,JobName,MaxRSS,Elapsed"
```

**make directory**
```
mkdir -p $HOME/user_guide_tutorials/first_bash_job
```

**submit job**
```
sbatch <batchfile>
```

**Example Bash script**
```
#!/bin/bash
#SBATCH --job-name=test_helloworld
#SBATCH --output=%x_%j.out
#SBATCH --mail-user="your-email-address"
#SBATCH --mail-type="ALL"
#SBATCH --partition="cpu-short"
#SBATCH --time=00:00:15
#SBATCH --ntasks=1
#SBATCH --mem=10M

echo "#### Starting Test"
echo "This is $SLURM_JOB_USER and my first job has the ID $SLURM_JOB_ID"
# get the current working directory
CWD=$(pwd)
echo "This job was submitted from $SLURM_SUBMIT_DIR and I am currently in $CWD"
# get the current time and date
DATE=$(date)
echo "It is now $DATE"
echo "Hello World from $HOSTNAME"
echo "#### Finished Test. Have a nice day"
```

**quit**
```
q
```
**Look at specific module**
```
module spider beast
```
**Load a module**
```
module load beast
```

**Look at text in file**
```
cat <filename>
```

**Enter VIM text editor**
```
vim
```

**Go into writing mode in VIM text editor**
```
a
```

**Save file in VIM**
```
:w filename
```

**Transferring files between Windows and ALICE**
Can use MobaXterm to swap files via upload and download

**Escape VIM text editor**
```
esc #to go to command mode
:q!
```
