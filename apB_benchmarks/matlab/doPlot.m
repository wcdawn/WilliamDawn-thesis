function doPlot(FS,ring,around,material,refpwr,refpwr2)

    if exist('refpwr2','var')
        % it does exist
    end

    f2f = 1.0;
    LW = 1;
    FN = 'Times New Roman';
    
    material_names = {'STEEL','AXBL','AXRF','TEST','DRIV','DRMOD','REFL','RFMOD','KNKREF','NASTL','CRD','NACRD'}';
    material_names = {'IC','OC','RB','CR','NA'};

    side = 1.0/sqrt(3.0);
    base = 0.5*side;
    hex = zeros(7,2);
    hex(1,1) = base;
    hex(1,2) = 0.5;
    hex(2,1) = - base;
    hex(2,2) = 0.5;
    hex(3,1) = -side;
    hex(3,2) = 0.0;
    hex(4,1) = - base;
    hex(4,2) = - 0.5;
    hex(5,1) = base;
    hex(5,2) = - 0.5;
    hex(6,1) = side;
    hex(6,2) = 0.0;
    hex(7,:) = hex(1,:); % close the loop

    figure
    hold on

    % do the plotting
    for i = 1:length(ring)
        xc = 0.0; yc = 0.0;
        if (ring(i) > 1)
            % calculate xCenter yCenter
            this_length = (ring(i)-1)*f2f;
            k = floor((around(i) - 1) / (ring(i)-1)) + 1;
            
            k = k-1; % adjust so that #1 is on the 60deg line
            if (k<1)
                k=6;
            end
            
            % this formula is from a long time ago... idk how...
            alpha = pi/6.0 + pi/3.0 * (k-1);
            delta_x = this_length*cos(alpha);
            delta_y = this_length*sin(alpha);
            n = max([ring(i)-1,1]);
            dx = delta_x / n;
            dy = delta_y / n;
            
            % first, find the points of a hexagon with point at top instead of
            % a flat. this is because a hexagon with flat on top tessalates 
            % with a point on top
            bigf2f = this_length * sqrt(3.0);
            shift = k-1;
            if (shift < 1)
                shift=6;
            end
            % calculate hexagon xc&yc appropriately
            xc = -hex(shift,2) * bigf2f;
            yc =  hex(shift,1) * bigf2f;
            xc = xc - dx * (mod(around(i)-1,ring(i)-1));
            yc = yc - dy * (mod(around(i)-1,ring(i)-1));
        end
        
        this_hex(:,1) = hex(:,1) * f2f + xc;
        this_hex(:,2) = hex(:,2) * f2f + yc;
        plot(this_hex(:,1),this_hex(:,2),'k-','LineWidth',LW)
        
        % put the text there
        if (refpwr(i) == 0.0)
%             this_str = sprintf('%d',material(i));
%             this_str = sprintf('%d\n---',material(i));
            this_str = material_names{material(i)};
            if ((strcmp(this_str,'CR')) && ((ring(i) == 6) || (ring(i) == 7)))
                fill(this_hex(:,1),this_hex(:,2),0.6*ones(1,3));
            end
        else
%             this_str = sprintf('%d',material(i));
%             this_str = sprintf('%d\n%.4f',material(i),refpwr(i));
            if (exist('refpwr2','var'))
                this_str = ...
                    sprintf('%d\n%.4f\n%.4f',material(i),refpwr(i),refpwr2(i));
            end
            this_str = material_names{material(i)};
        end
        text(xc,yc,this_str,'FontName',FN,'FontSize',FS,...
            'HorizontalAlignment','center','VerticalAlignment','middle');
    end
    
end
