# Tips
Add the following sentence into the circulate process of com_r

if j==1 && index(1)<0.999
        break
end



This is because our initial data is very special where all elements are all 1.

In the program Poincare, we can add at the begin of the circulate process.
U(:,i)=v;

Add at the end of the circulate process.
if isnan(max(v))
        v=U(:,i);
        break
    end