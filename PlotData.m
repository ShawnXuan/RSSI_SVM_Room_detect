function [sv, si] = PlotData(data, headers)
  [nr,nc] = size(data);
  %get room list and room number
  rooms = unique(data(:,1));
  room_num = length(rooms);

  %find the most popular wifi
  %there are 3 wifi can be detected in these rooms, try to find most popular 3s.
  %in the data file, -100db means this wifi is not detected in this room, 
  %so count the number of -100db of each room, choose the minmum 3 ones.
  s=[];
  for i=2:nc
      s=[s sum(data(:,i)==-100)];
  end
  %sv: n smallest values, si: index of smallest values
  [sv, si] = getMink(s, 3);

  %%show datas 
  figure
  xlabel(headers(si(1)){1})
  ylabel(headers(si(2)){1})
  zlabel(headers(si(3)){1})
  si = si+1;

  hold
  %http://www.mathworks.com/help/matlab/lef/plot.html
  plot_markers='o+*.xsd^';
  plot_colors='mcrgbkyw';
  for i=1:min(room_num,8)
      plot_x = data(data(:,1)==rooms(i),si(1));
      plot_y = data(data(:,1)==rooms(i),si(2));
      plot_z = data(data(:,1)==rooms(i),si(3));
      plot_specifier = [plot_markers(i),plot_colors(i)];
      plot3(plot_x, plot_y, plot_z,plot_specifier);
      %legend(num2str(rooms(i)))
  end
  legend(num2str(rooms(1:min(room_num,8))));
end