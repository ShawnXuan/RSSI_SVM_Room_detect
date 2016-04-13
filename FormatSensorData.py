# coding: utf-8
import os
def WriteData(features, filename, wfile_object):
    features_number = len(features)
    row = [''] * features_number
    row[0] = filename[filename.rfind('R')+1:filename.rfind('.')]
    file_object = open(filename)  
    try:  
        lines = file_object.readlines()
        for line in lines:
            parts = line.split(',')
            for i in range(1,8):
                row[i] = parts[i-1]
            for i in range(8, features_number):
                row[i] = '-100'
               
            for i in range(7,len(parts)-1):
                #wifi = parts[i].split('/')
                #if wifi[0]!='':
                #    if wifi[0] in features:
                #        row[features[wifi[0]]] = wifi[1]
                mac = parts[i][0:17]
                rssi = parts[i][18:]
                if mac in features:
                    row[features[mac]] = rssi        
            w = ''
            for i in row:                
                w = w + i + ','
            w = w + '\n'
            wfile_object.writelines(w)
            #break
    finally:  
        file_object.close()

def GetFeatures(features, filename):
    file_object = open(filename)  
    try:  
        lines = file_object.readlines()
        for line in lines:
            parts = line.split(',')
            for i in range(7,len(parts)-1):
                #wifi = parts[i].split('/')
                #if wifi[0]!='':
                #    if wifi[0] not in features:
                #        features[wifi[0]]=len(features)
                mac = parts[i][0:17]
                if mac not in features:
                    features[mac]=len(features)
    finally:  
        file_object.close()
    return features

if __name__=='__main__':
    #Time AX AY AZ GX GY GZ
    features = {'file': 0, 'Time': 1, 'AX': 2, 'AY': 3, 'AZ': 4, 'GX': 5, 'GY': 6, 'GZ': 7}
    files = os.listdir('.')
    for file in files:
        if file[0:7]=='Sensor_':
            features = GetFeatures(features,file)
    columns= sorted(features.items(), key=lambda d:d[1])
    print(features)
    w=''
    for col in columns:
        w = w + col[0] + ','
    w = w + '\n'
    #for i in range(7, features_number):
    #    w=w+
    file_object = open('train_0309.csv', 'w')
    file_object.writelines(w)
                
    for file in files:
        if file[0:7]=='Sensor_':
            WriteData(features, file, file_object)
    file_object.close() 
