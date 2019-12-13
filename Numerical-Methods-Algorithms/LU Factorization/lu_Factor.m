
function [L,U,P]=lu_Factor(A)
%lu_Factor
%Created: Oct 24,2019
%Created by: Julian Ferrer
%Last modified: Oct 27,2019
%Description: Transforms a square martix A into an Upper (U) and Lower (L)
%triangular matrix such that [P]*[A]=[L]*[U]
%Inputs:  A - a square matrix
%Outputs: L - a lower triangular matrix storing ?
%         U - an upper triangular matrix of A after gauss elimination
%         P - identity matrix of A with switched rows coorisponding to row
%         switches that occured in gauss elimination from A to U
    
    if ismatrix(A)==0 %check that input is matrix
        error('Invalid input: Must input a square matrix')
    end
    
    a_size = size(A);    %get matrix dimentions
    
    if a_size(1)~=a_size(2) %check that input matrix is square
        error('Invalid input: Must input a square matrix')
    end
    
    c_size = a_size(2);  %get column length
    P = eye(c_size);     %create identity matrix
    L = P;               %Initialize lower matrix
    U=A;                 %Initialize upper matrix

    for column=1:c_size-1                           %Iterate through columns that will be manipulated
        [U,P]=pivot(column,column,U,P);             %Pivot at section of colum that will be manipulated
        for row=column+1:c_size                     %Iterate through rows to be evaulated
            if U(row,column)~=0                     %Check that matrix element needs to be changed
                f=U(row,column)/U(column,column);   %Create factor f to multiply with
                U(row,:)=U(row,:)-(f.*U(column,:)); %Use factor f to manipulate matrix so that matrix element is zero
                L(row,column)=f;                    %Store factor f in lower matrix
            end        
        end
    end

    function [A,P] = pivot(p_row, p_column, A, P)
        %Description: Swithces row p_row of matrix A with the row
        %containing the largest column p_column value below and including
        %p_row
        %Inputs: p_row    - row index of pivot element
        %        p_column - column index of pivot element
        %        A        - matrix to be pivoted
        %        P        - identity matrix to be pivoted 
        %Outputs: A - pivoted matrix
        %         P - pivoted identity matrix
        
        A_new = A;                      
        P_new = P;                      
        A_size = size(A); %Store dimentions of matrix
        n = A_size(2);    %Store column size of matrix 
        
        c_eval = A(p_row :n,p_column);  %Isolate column that will be evaluated
        [~,max_ind] = max(abs(c_eval)); %Store the evaulated column index of where the max value occures
        max_ind=max_ind+p_row-1;        %Store the matrix column index of where max value of evaluated column occurs
        A_new(p_row,:)=A(max_ind,:);    %Replace the row of the pivot element with the row containing the max value
        A_new(max_ind,:)=A(p_row,:);    %Replace the row containing the max value with the row of the pivot element 
        P_new(p_row,:)=P(max_ind,:);    %Manipulate P the same as A
        P_new(max_ind,:)=P(p_row,:);    %

        P=P_new;
        A=A_new;
    end
end


