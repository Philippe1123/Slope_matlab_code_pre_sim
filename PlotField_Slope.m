function [ output_args ] = PlotField_Slope( )
%PLOTFIELD Summary of this function goes here
%   Detailed explanation goes here


%% Save nodes and elements


 Data="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/Testing_Fields/Data"
 Lvl="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/Testing_Fields/lvl"
 
 order=dlmread(Data);
 level=dlmread(Lvl);
 
 if(order==0)
     
 PathNodes_Fine="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/h_refinement/Nodes_L_"+level+".txt";
 PathElements_Fine="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/h_refinement/Elements_L_"+level+".txt";
 Nodes_Fines=dlmread(PathNodes_Fine);
 Elements_Fine=dlmread(PathElements_Fine);
 
 PathField_Fine="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/Testing_Fields/Fine";
 Field_Fine=dlmread(PathField_Fine);
%  
 level=level-1;
 if(level>0)
  PathNodes_Fine="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/h_refinement/Nodes_L_"+level+".txt";
 PathElements_Fine="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/h_refinement/Elements_L_"+level+".txt";
 Nodes_C=dlmread(PathNodes_Fine);
 Elements_C=dlmread(PathElements_Fine);
 
  
 PathField_Coarse="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/Testing_Fields/Coarse";
 Field_C=dlmread(PathField_Coarse);
 end
 
 % % %     file_nodes_centers_f="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/h_refinement/ElementsCenter_L_"+level+".txt";
% % %     nodes_centers_f=dlmread(file_nodes_centers_f);
% % % %    Field_Fine_centers=griddata(Nodes_Fines(:,2),Nodes_Fines(:,3),Field_Fine,nodes_centers_f(:,1),nodes_centers_f(:,2),'cubic');  % Cohesion in N/m^2
% % %      
% % % 
% % % %  
% % %  PathField_Fine="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/Testing_Fields/Fine";
% % %   Field_Fine_centers=dlmread(PathField_Fine);
 
 elseif(order==1)
      
 PathNodes_Fine="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/p_refinement/GaussPoints_L_"+level+".txt";
 PathElements_Fine="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/p_refinement/Elements_L_"+level+".txt";
 
  Grid_Fine="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/p_refinement/Nodes_L_"+level+".txt";
  Grid_Fine=dlmread(Grid_Fine);

 Nodes_Fines=dlmread(PathNodes_Fine);
 Elements_Fine=dlmread(PathElements_Fine);
 
 PathField_Fine="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/Testing_Fields/Fine";
 Field_Fine=dlmread(PathField_Fine);
%  
 level=level-1;
  if(level>0)

  PathNodes_Fine="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/p_refinement/GaussPoints_L_"+level+".txt";
 PathElements_Fine="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/p_refinement/Elements_L_"+level+".txt";
 Nodes_C=dlmread(PathNodes_Fine);
 Elements_C=dlmread(PathElements_Fine);
 
  
 PathField_Coarse="/home/philippe/.julia/dev/Applications/applications/SPDE/data/Mesh/Slope/Testing_Fields/Coarse";
 Field_C=dlmread(PathField_Coarse);
  end
 end


%%%%Field Read In


% % % vecx_F=min(nodes_centers_f(:,1)):(max(nodes_centers_f(:,1))-min(nodes_centers_f(:,1)))/(length(unique(nodes_centers_f(:,1)))-1):max(nodes_centers_f(:,1))
% % % vecy_F=min(nodes_centers_f(:,2)):(max(nodes_centers_f(:,2))-min(nodes_centers_f(:,2)))/(length(unique(nodes_centers_f(:,2)))-1):max(nodes_centers_f(:,2))
% % % 
% % % [xq,vq]=meshgrid(vecx_F,vecy_F);
% % % zq=griddata(nodes_centers_f(:,1),nodes_centers_f(:,2),Field_Fine_centers,xq,vq);
% % % 
% % %  figure
% % %  surf(xq,vq,zq);
% % % %   axis equal
% % % %  view(2)
% % % %  axis([0 5 0 1])


%%%%%%%Fine
% figure
% vecx_F=min(Nodes_Fines(:,2)):(max(Nodes_Fines(:,2))-min(Nodes_Fines(:,2)))/(length(unique(Nodes_Fines(:,2)))-1):max(Nodes_Fines(:,2))
% vecy_F=min(Nodes_Fines(:,3)):(max(Nodes_Fines(:,3))-min(Nodes_Fines(:,3)))/(length(unique(Nodes_Fines(:,3)))-1):max(Nodes_Fines(:,3))
% 
% [xq,vq]=meshgrid(vecx_F,vecy_F);
% zq=griddata(Nodes_Fines(:,2),Nodes_Fines(:,3),Field_Fine,xq,vq);
%  surf(xq,vq,zq);
if(order==1)
NNodes=[ 1 2 6 7 8 9]; 
 t=[ 8 9 ; 9 6 ; 6 1; 1 2 ; 2 7 ; 7 8]

Nodes_Fines_n=[Grid_Fine(NNodes,:); Nodes_Fines];
t=[5 6; 6 3; 3 1; 1 2; 2 4; 4 5];
figure
 DT=delaunayTriangulation(Nodes_Fines_n(:,2:3),t);
 IO = isInterior(DT);
 zq=griddata(Nodes_Fines(:,2),Nodes_Fines(:,3),Field_Fine,Nodes_Fines_n(:,2),Nodes_Fines_n(:,3),'cubic');
 g=trisurf(DT(IO, :),Nodes_Fines_n(:,2),Nodes_Fines_n(:,3), zq);
 %   triplot(DT(IO, :),DT.Points(:,1), DT.Points(:,2),'LineWidth', 2);
%shading interp
hold on

C=t;
X=Nodes_Fines(:,2:3);
plot(X(C'),X(C'+size(X,1)),'-r', 'LineWidth', 2);
else
figure
 trisurf(Elements_Fine(:,5:7),Nodes_Fines(:,2),Nodes_Fines(:,3), Field_Fine)
view(2)
end
 %surf(xq,vq,zq);
% axis equal
%view(2)
%axis([0 5 0 1])


%%%%%Coarse



% vecx_F=min(Nodes_C(:,2)):(max(Nodes_C(:,2))-min(Nodes_C(:,2)))/(length(unique(Nodes_C(:,2)))-1):max(Nodes_C(:,2))
% vecy_F=min(Nodes_C(:,3)):(max(Nodes_C(:,3))-min(Nodes_C(:,3)))/(length(unique(Nodes_C(:,3)))-1):max(Nodes_C(:,3))
% 
% [xq,vq]=meshgrid(vecx_F,vecy_F);
% zq=griddata(Nodes_C(:,2),Nodes_C(:,3),Field_C,xq,vq);
% 
%  figure
%  surf(xq,vq,zq);
 figure
 
 Dt=delaunay(Nodes_C(:,2),Nodes_C(:,3));
  g=trisurf(Dt,Nodes_C(:,2),Nodes_C(:,3), Field_C);
 get(g)
  set(g,'linestyle','none');
  hold on
stem3(Nodes_C(:,2),Nodes_C(:,3),Field_C,'r')
 
%  figure
%   trisurf(Elements_C(:,5:7),Nodes_C(:,2),Nodes_C(:,3), Field_C);
% axis equal
%view(2)
%axis([0 5 0 1])

 %Name=char("level"+id);
% Plot2LaTeX(figure(id+1),Name)
%figure
%stem3(centers_coord(:,1),centers_coord(:,2),c_centers,'r')

end

