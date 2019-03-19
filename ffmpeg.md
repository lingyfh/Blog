 #### FFmpeg pcm to wav
 ffmpeg -f s16le -ar 32k -ac 1 -i xxxxx.pcm xxxxx.wav

 #### FFmpeg dump rtmp to file
 ffmpeg -i rtmp://xxxxxx -acodec copy -vcodec copy youpath.flv

 #### FFmpeg mp3 to flac
 ffmpeg -i xxx.mp3 -c:a flac xxx.flac
 
 #### FFmpeg mp3 to mkv 
 ffmpeg -loop 1 -i xxx.jpg -i xxxx.mp3 -c:a copy -c:v libx264 -shortest xxxx.mkv

 #### FFmpeg show devices
 ffmpeg -f avfoundation -list_devices true -i ""
