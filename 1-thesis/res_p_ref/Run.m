out_p=zeros(8,1)
dof_p=[48,160,338,582,892,1268,1710,2218,2792]
for id = 0:8

test=dlmread(("qoi_"+char(num2str(id))+".txt"));
out_p(id+1)=test(end,1);

end
figure()
loglog(dof_p,abs(out_p-out_p(end))/out_p(end),'-*')


out_h=zeros(4,1)
dof_h=[48,160,582,2218,8658,34210,136002]
for id = 0:6

test=dlmread(("/home/philippe/Desktop/Slope_Matlab/1-thesis/res_h_ref_2/qoi_"+char(num2str(id))+".txt"));
out_h(id+1)=test(end,1);

end
hold on
loglog(dof_h,abs(out_h-out_p(end))/out_p(end),'-*')
xlabel("Number of DOF's [/]")
ylabel("relative error [/]")
legend("p-refinement","h-refinement")

grid on
matlab2tikz('floatFormat','%.20f','convergence_slope')

out