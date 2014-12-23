IconCutter
==========

Painless way to resize your icon for all platforms: wechat, weibo, ios, android, and so on

## Installation

1. If you have ruby env installed on your computer, just run below command:

```bash
gem install iconcutter
```

2. Or, you can directly clone this repo, see below:

``` bash
git clone https://github.com:lyfeyaj/iconcutter.git
```

## Usage

Run command as below: 

``` bash
## Options
# Usage: crop_image_as_app_icons [options] image_file
#    -p, --platform x,y,z             Specify app plaform: android,ios,wechat,weibo,ios_submition,all
#    -o, --out [DIR]                  output icons directory
#    -h, --help                       Show help message

iconcutter your_path_to_the_image -o ~/YourIconDirectory
```

Enjoy, versions of icons for all kinds of platforms will be generated!

## Contribute

+ Fork
+ Create a new branch (git checkout -b my-new-feature)
+ Commit your patch or feature (git commit -am 'Added some feature')
+ Push your codes (git push origin my-new-feature)
+ Create a new push request

## LICENCE

[MIT](https://github.com/lyfeyaj/iconcutter/blob/master/LICENSE)

## Author

[Felix Liu](https://github.com/lyfeyaj)
