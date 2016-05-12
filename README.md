#RSSI SVM Room detection
##1. GetAcc.7z
-----------
This is an android app source code which is developed on Android Studio. Here we suppose you have ability to debug or build apk by yourself. 
This app is used to collect data also for the test as well.
The main screen-shot likes the figure below. On default, the app will update sensor data around every 100ms.
<img src=https://github.com/ShawnXuan/RSSI_SVM_Room_detect/blob/master/img/GetAcc.png/ width=150>

##2. Data Collection file
Click “START RECORDING” button will create an txt file and record these sensor data, then save it when finish. The txt file will be named like “Sensor_1458571074272.txt”, “1458571074272” is the time stamp when create this file. This file will be stored in the “test” folder of SDCard, please make sure you can find it (I use other app such as “file manager”). 
The file looks like this
<img>

##3. Data collection in different rooms
Data need to be collected in different rooms(or areas) in order to fulfill room-level accuracy.
Please rename these files manually with a letter “R” and 3 digits room number. This will be the label of training set. 

##4.Data Pretreatment
“FormatSensorData.py” is a script to deal with these data for future use.
Edit this script and scroll down, you can change the output file name as you want.
<img>
Put this script and the sensor data files in the same folder, and run this script. A new csv file with you specified name will be create for octave or matlab training.

##5.Training
Open “RSSI_SVM_1to1.m” in your octave or matlab environment. Change the input file name in line 5.
<img>
And run this m file for training.

##6.Model.mat 
After training, the training model parameters are stored in “model.mat”, please copy this file to your smart phone, in the same folder ”test” where you find your sensor data file.

##7.Run the app 
then you can find move with your phone among the rooms to test the result.

