function [vertex,face] = read_vtk(filename, verbose)

% read_vtk - read data from VTK file.

fid = fopen(filename,'r');
if( fid==-1 )
    error('Can''t open the file.');
    return;
end

str = fgets(fid);   % -1 if eof
if ~strcmp(str(3:5), 'vtk')
    error('The file is not a valid VTK one.');    
end

%%% read header %%%
str = fgets(fid);
str = fgets(fid);
str = fgets(fid);
str = fgets(fid);
str = fgets(fid);
nvert = sscanf(str,'%*s %d %*s', 1);

% read vertices
[A,cnt] = fscanf(fid,'%f %f %f', 3*nvert);
if cnt~=3*nvert
    warning('Problem in reading vertices.');
end
A = reshape(A, 3, cnt/3);
vertex = A;

% read polygons
str = fgets(fid);
str = fgets(fid);

info = sscanf(str,'%c %*s %*s', 1);

if((info ~= 'P') && (info ~= 'V'))
    str = fgets(fid);    
    info = sscanf(str,'%c %*s %*s', 1);
end

% read vertex ids

if((info ~= 'P') && (info ~= 'V'))
    data = sscanf(str,'%*s %d %d',2);
    nelem = data(1);
    nmem = data(2);
    nodeperelem = ceil(nmem/nelem)-1;
    face = zeros(nelem,nodeperelem);
    for i = 1:nelem
        str = fgets(fid);
        data = sscanf(str,'%d %d %d %d',4);
        face(i,:) = data(2:4);
    end    
end

fclose(fid);

return