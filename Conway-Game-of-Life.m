%creates new function with 1 output and 2 inputs, a random matrix and a
%number of iterations
function [new] = abj37miniProject3(randomMat, n)

%for loop for number of iterations
for numoftimes = 1:n
    %dimentions of radom matrix 
    [xdim, ydim] = size(randomMat);
    %Find the size of our matrix for input 2D Matrix Preallocate output matrix
    sum = zeros(xdim,ydim);
    %Create a zero-ringed input matrix
    ringedMat = zeroRing(randomMat);
    %for loop of number of rows of random mat
    for i = 1:xdim
        %for loop of number of collumns of random mat
        for j = 1:ydim
            %creates a matrix of the neighbors around the point
            subMat = ringedMat(i:i+2,j:j+2);
            %sums the neighbors and creates a new matrix of the sums
            sum(i,j) = sumMatrix(subMat)-ringedMat(i+1,j+1);
            %iterates through the number of collums and rows if the value is true 
            if(ringedMat(i+1,j+1) == 1)
                %if sum is 2 or 3
                if sum(i,j)==2 || sum(i,j)==3
                    %creates new matrix with the corrects value 
                    new(i,j)=1;
                else %if not 2 or 3 neighbors
                    %creates new matrix with the corrects value
                    new(i,j)=0;
                end
            end
            %iterates through the number of collums and rows if the value
            %is zero
            if(ringedMat(i+1,j+1) == 0)
                %creates new matrix with the correct value if 3 neighbors
                if sum(i,j)==3
                    new(i,j)=1;
                else
                    %creates new matrix with the correct value if not 3 neighbors
                    new(i,j)=0;
                end
            end
        end
    end
    %sets the new matrix into the random matrix
    randomMat=new;
end




