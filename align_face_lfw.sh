#!/usr/bin/env sh 

#lfw dataset align

raw_data_path=/home/gavinpan/workspace/dataset/lfw/lfw/
deep_align_data_path=/home/gavinpan/workspace/dataset/lfw/lfw-deepfunneled/
align_data_path=/home/gavinpan/workspace/dataset/lfw/lfw-align/

#raw_data_path=/home/gavinpan/workspace/dataset/lfw/lfw-deepfunneled/
#deep_align_data_path=/home/gavinpan/workspace/dataset/lfw/lfw-deepfunneled/
#align_data_path=/home/gavinpan/workspace/dataset/lfw/lfw-align-deep/

face_size=128
ts=0.1

num_process=44
landmarks=innerEyesAndBottomLip



# step1:align the face iamge
if ! [ -e $align_data_path ];then #-e exist
   mkdir -p $align_data_path  #-p create no exist folder 
   for N in $(seq $num_process);do
	  #echo "the sub-process is : $N"	
	  python ./util/align_face.py $raw_data_path align $landmarks $align_data_path --ts $ts --size $face_size --fallbackLfw $deep_align_data_path &
   done
else
   echo "$align_data_path already exist."
fi
wait
echo "Align face image done"
