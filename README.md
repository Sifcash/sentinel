# Sifcash Sentinel

An all-powerful toolset for Sifcash.

Sentinel is an autonomous agent for persisting, processing and automating Sifcash V8.2 governance objects and tasks, and for expanded functions in the upcoming releases.

Sentinel is implemented as a Python application that binds to a local version 8.2 sifcashd instance on each Sifcash V8.2 Masternode.

This guide covers installing Sentinel onto an existing Masternode in Ubuntu 14.04 / 16.04.

## Installation

### 1. Install Prerequisites

Make sure Python version 2.7.x or above is installed:

    python --version

Update system packages and ensure virtualenv is installed:

    $ sudo apt-get update
    $ sudo apt-get -y install python-virtualenv

Make sure the local Sifcash daemon running is at least version 8.2 (80201)

    $ sifcash-cli getinfo | grep version

### 2. Install Sentinel

Clone the Sentinel repo and install Python dependencies.

    $ git clone https://github.com/sifcash/sentinel.git && cd sentinel
    $ virtualenv ./venv
    $ ./venv/bin/pip install -r requirements.txt

### 3. Set up Cron

Set up a crontab entry to call Sentinel every minute:

    $ crontab -e

In the crontab editor, add the lines below, replacing '/home/YOURUSERNAME/sentinel' to the path where you cloned sentinel to:

    * * * * * cd /home/YOURUSERNAME/sentinel && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1

### 4. Test the Configuration

Test the config by runnings all tests from the sentinel folder you cloned into

    $ ./venv/bin/py.test ./test

With all tests passing and crontab setup, Sentinel will stay in sync with sifcashd and the installation is complete

## Configuration

An alternative (non-default) path to the `sifcash.conf` file can be specified in `sentinel.conf`:

    sifcash_conf=/path/to/sifcash.conf

## Troubleshooting

To view debug output, set the `SENTINEL_DEBUG` environment variable to anything non-zero, then run the script manually:

    $ SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py

### License

Released under the MIT license, under the same terms as SifcashCore itself. See [LICENSE](LICENSE) for more info.
