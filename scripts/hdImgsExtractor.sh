# !/bin/bash
# This extracts PNG files from HD videos
# It should be run from the same directory containing the folder "hdVideos"
# (E.g., sampleData/ )
# See http://domedb.perception.cs.cmu.edu

inputFolderName=hdVideos
outputFolderName=hdImgs
camIdx=-1;
for p in 0
	do
	for c in {0..30}
		do
		videoFileName=$(printf "$inputFolderName/hd_%02d_%02d.mp4" $p $c)
		outputvideoFileName=$(printf "$outputFolderName/%02d_%02d" $p $c)
		if [ -f $videoFileName ]; then
		
			mkdir -pv $outputvideoFileName
			echo "Generate Images from $videoFileName"
			fileName=$(printf "$outputvideoFileName/%02d_%02d_%%08d.png" $p $c) 
			ffmpeg -i $videoFileName -an -f image2 -start_number 0 "$fileName"
		else
			echo "$videoFileName (Skipping.)"
		fi
	done
done


