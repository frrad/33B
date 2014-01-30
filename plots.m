f[x_, y_] := x + y
plot = VectorPlot[{1, f[x, y]}, {x, -2, 2}, {y, -2, 2}];
sol = Plot[-1 - x + E^x, {x, -2, 2}];
both = Show[plot, sol]
Export["figures/2.1.17.pdf", both]


f[x_, y_] := x Tan[y/2]
plot = VectorPlot[{1, f[x, y]}, {x, -2, 2}, {y, -1, 1}];
Export["figures/2.1.19.pdf", plot]

f[x_, y_] := (x - y) / (x + y)
plot = StreamPlot[{1, f[x, y]}, {x, -5, 5}, {y, -5, 5}];
Export["figures/2.1.extra.pdf", plot]


f[x_, t_] := (x^2 - 1) E^(t x);
border1[t_] := -1;
border2[t_] := 1;
from = -3; to = 3;
t0 = 1; x0 = 0;
ode = {x'[t] == f[x[t], t], x[t0] == x0};
sol = NDSolve[ode, x, {t, from, to}];
stream = StreamPlot[{1, f[x, t]}, {t, from, to}, {x, -2, 2}];
solplot = Plot[x[t] /. sol, {t, from, to}, PlotStyle -> Thick];
fence1 = Plot[border1[t], {t, from, to}, 
   PlotStyle -> Directive[Thick, Red]];
fence2 = Plot[border2[t], {t, from, to}, 
   PlotStyle -> Directive[Thick, Red]];
point = Graphics[{PointSize[Large], Point[{t0, x0}]}];
picture = Show[stream, solplot, fence1, fence2, point];
Export["figures/2.7.first.pdf", picture]

f[x_, t_] := x - t^2 + 2 t;
border1[t_] := t^2;
border2[t_] := t^2;
from = -3; to = 3;
t0 = 0; x0 = 1;
ode = {x'[t] == f[x[t], t], x[t0] == x0};
sol = NDSolve[ode, x, {t, from, to}];
stream = StreamPlot[{1, f[x, t]}, {t, from, to}, {x, -2, 2}];
solplot = Plot[x[t] /. sol, {t, from, to}, PlotStyle -> Thick];
fence1 = Plot[border1[t], {t, from, to}, 
   PlotStyle -> Directive[Thick, Red]];
fence2 = Plot[border2[t], {t, from, to}, 
   PlotStyle -> Directive[Thick, Red]];
point = Graphics[{PointSize[Large], Point[{t0, x0}]}];
picture = Show[stream, solplot, fence1, fence2, point];
Export["figures/2.7.second.pdf", picture]


f[x_, t_] := Sqrt[x^2 + 1] Log[t + 1] (x + Cos[t]) + Sin[t];
border1[t_] := -Cos[t];
from = -1; to = 2 Pi;
to2 = 1.75;
light = -2; height = 6;
t0 = 0; x0 = 0;
ode = {x'[t] == f[x[t], t], x[t0] == x0};
sol = NDSolve[ode, x, {t, from, to2}];
stream = StreamPlot[{1, f[x, t]}, {t, from, to}, {x, light, height}];
solplot = Plot[x[t] /. sol, {t, from, to2}, PlotStyle -> Thick];
fence1 = Plot[border1[t], {t, from, to}, 
   PlotStyle -> Directive[Thick, Red]];
point = Graphics[{PointSize[Large], Point[{t0, x0}]}];
picture = Show[stream, fence1, solplot, point];
Export["figures/2.7.extra.pdf", picture]

Quit[]
