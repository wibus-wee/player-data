# 遍历全部文件夹中的歌曲，获取歌曲的时长
for file in `find . -name "*.mp3"`
do
    echo $file
    echo `ffmpeg -i $file 2>&1 | grep "Duration" | cut -d ' ' -f 4 | sed s/,// | awk -F: '{print ($1*3600+$2*60+$3)*100}'`
done