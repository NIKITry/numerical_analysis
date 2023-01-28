[n, h, arrSepar1] = Separation(2,[]);
value = Simpson(h, n, arrSepar1);
[n, h, arrSepar] = Separation(4,[]);
value1 = Simpson(h, n, arrSepar);
ans = abs(value - value1) / (2^4-1);