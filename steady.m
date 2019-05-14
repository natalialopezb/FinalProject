function F = steady(x)

global rx rpp rpm rs rlu rls rc rjnkp rjnkm ra ri dx dl INi INj ram rcm

F(1) = rpm*x(2)-rpp*x(1)-dl*x(1)+INi;
F(2) = rpp*x(1)-rpm*x(2)-dl*x(2);
F(3) = rx*x(2)-dx*x(3)-rs*x(3);
F(4) = rs*x(3)-dx*x(4);
F(5) = rlu*x(3)-dl*x(5);
F(6) = rls*x(4)-dl*x(6);
F(7) = INj+rjnkm*x(8)-rjnkp*x(7)*x(2)-dl*x(7);
F(8) = rjnkp*x(7)*x(2)-rjnkm*x(8)-dl*x(8);
F(9) = rc*x(6)-ri*x(5)-rcm*x(9);
F(10) = ra*x(8)-ram*x(10);