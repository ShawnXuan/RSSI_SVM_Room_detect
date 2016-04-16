function [data, headers] = LoadSensorData(filename)
  wifi_column_from = 9;
   
  fid = fopen(filename);
  t = textscan(fid,'%s',1,'Delimiter',',');
  %read first line to get headers
  headers = t{1};

  %keep WIFI points
  headers = headers(wifi_column_from:length(headers));
  fclose(fid);

  data = csvread(filename,1,0);
  [nr,nc] = size(data);
  %read labels and wifi strength
  data = data(:,[1,wifi_column_from:nc-1]);

  %filter repeated data
  data = unique(data,'rows');
 end