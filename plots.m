f[x_, y_] := x + y
plot = VectorPlot[{1, f[x, y]}, {x, -2, 2}, {y, -2, 2}];
sol = Plot[-1 - x + E^x, {x, -2, 2}];
both = Show[plot, sol]
Export["figures/2.1.17.pdf", both]


f[x_, y_] := x Tan[y/2]
plot = VectorPlot[{1, f[x, y]}, {x, -2, 2}, {y, -1, 1}];
Export["figures/2.1.19.pdf", plot]

Quit[]
