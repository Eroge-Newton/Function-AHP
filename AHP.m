function Q=AHP(A)
[m,n]=size(A);
RI=[0 0 0.58 0.90 1.12 1.24 1.32 1.41 1.45 1.49 1.51];
R=rank(A);                         % Find the rank of the judgment matrix
[V,D]=eig(A);                      % Find the eigenvalue and eigenvector of the judgment matrix, V eigenvalue, D eigenvector;
tz=max(D);
B=max(tz);                         % λmax : Maximum eigenvalue B
[row, col]=find(D==B);             % The location of the maximum eigenvalue
C=V(:,col);                        % Corresponding eigenvector
CI=(B-n)/(n-1);                    % Calculate the consistency check index CI
CR=CI/RI(1,n);   

if CR<0.10
    disp('CI=');
    disp(CI);
    disp('CR=');
    disp(CR);
    disp('λmax=');
    disp(B)
    disp('The comparison matrix A passes the consistency test, and the weight vector Q of each vector is');
    Q=zeros(n,1);
    for i=1:n
        Q(i,1)=C(i,1)/sum(C(:,1)); % Eigenvector normalization
    end
else
    disp('Contrast matrix A failed the consistency test, and contrast matrix A needs to be reconstructed');
end
