function B = extend4(A)
Alr = fliplr(A);
Aud = flipud(A);
Aco = fliplr(Aud);
B = [A Alr ; Aud Aco];
% B = [Aco Aud Aco; Alr A Alr; Aco Aud Aco];
