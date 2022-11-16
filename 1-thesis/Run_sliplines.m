out_p=zeros(8,1)
dof_p=[48,160,338,582,892,1268,1710,2218,2792]
close all 
clc
str_folder="/home/philippe/Desktop/Slope_Matlab/1-thesis/";


for id = 0:8
    
    
 
file_nodes=strcat(str_folder,"Mesh/Slope/p_refinement/Nodes_L_",char(num2str(id)),".txt");
Nodes=dlmread(file_nodes);

U=dlmread(("/home/philippe/Desktop/Slope_Matlab/1-thesis/res_p_ref/full_"+char(num2str(id))+".txt"));

dispx=zeros(length(U),3);
dispy=zeros(length(U),3);

for id=1:length(U)
  dispx(id,1)=U(id,1);
  dispx(id,2)=U(id,2);
  
  
  dispx(id,3)=U(id,3);

  dispy(id,1)=U(id,1);
  dispy(id,2)=U(id,2);
  
  
  dispy(id,3)=U(id,4);
    
    
end
figure()
scatter3(dispy(:,1),dispy(:,2),sqrt(dispy(:,3).^2+dispx(:,3).^2),100,sqrt(dispy(:,3).^2+dispx(:,3).^2),'filled')
cb = colorbar;
end



for id = 0:6

file_nodes=strcat(str_folder,"Mesh/Slope/h_refinement/Nodes_L_",char(num2str(id)),".txt");
Nodes=dlmread(file_nodes);

U=dlmread(("/home/philippe/Desktop/Slope_Matlab/1-thesis/res_h_ref_2/full_"+char(num2str(id))+".txt"));

dispx=zeros(length(U),3);
dispy=zeros(length(U),3);

for id=1:length(U)
  dispx(id,1)=U(id,1);
  dispx(id,2)=U(id,2);
  
  
  dispx(id,3)=U(id,3);

  dispy(id,1)=U(id,1);
  dispy(id,2)=U(id,2);
  
  
  dispy(id,3)=U(id,4);
    
    
end
figure()
scatter3(dispy(:,1),dispy(:,2),sqrt(dispy(:,3).^2+dispx(:,3).^2),100,sqrt(dispy(:,3).^2+dispx(:,3).^2),'filled')
cb = colorbar;

end
hold on
loglog(dof_h,abs(out_h-out_p(end))/out_p(end),'-*')
xlabel("Number of DOF's [/]")
ylabel("relative error [/]")
legend("p-refinement","h-refinement")

grid on
matlab2tikz('floatFormat','%.20f','convergence_slope')

out