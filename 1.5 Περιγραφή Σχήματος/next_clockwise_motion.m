function next_current_pixel = next_clockwise_motion(b,p)

    if b==(p + [0 -1])
        c = b + [-1 0];
    elseif b==(p + [-1 -1])
        c = b + [0 1];
    elseif b==(p + [-1 0])
        c = b + [0 1];
    elseif b==(p + [-1 1])
        c = b + [1 0];
    elseif b==(p + [0 1])
        c = b + [1 0];
    elseif b==(p + [1 1])
        c = b + [0 -1];
    elseif b==(p + [1 0])
        c = b + [0 -1];
    else b==(p + [1 -1])
        c = b + [-1 0];
end
        
next_current_pixel = c;

end

