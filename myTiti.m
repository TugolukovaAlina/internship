% % myTiti
% 
% N = [19, 18, 10, 10];
% M = [3, 4, 3, 4];
% %data = csvread('1.csv'); n = 19; m = 3; 
% data = csvread('2.csv'); n = 19; m = 4;
% %data = csvread('3.csv'); n = 10; m = 3; 
% %data = csvread('4.csv'); n = 10; m = 4; 
% labels = {'No call', 'Poor', 'Medium', 'Good'};
% 
% type = { '+' '*' '.' 'x'	's' 'd' '^' 'v' '>' '<' 'p' 'h' 'o'};
% colors = {'y' 'm' 'c' 'r' 'g' 'b' 'k' 'y' 'm' 'c' 'r' 'g' 'b' 'k'};
% technique = {'C4.5 (pruned no iterations)' 'C4.5 (unpruned)' 'C4.5 (pruned)' 'AdaBoost C4.5 (10x)' 'AdaBoost C4.5 (25x)' 'Furia' 'Random Forest (25)' 'Random Forest (50)' 'Random Forest (50-5)' 'LogitBoost Random Forest (10x10)' 'JRip' 'AdaBoost JRip (10)' 'AdaBoost JRip (25)' 'Bagging C4.5 (25)' 'Naive Bayes' 'SVM' 'kNN' 'Tuned C4.5 (unpruned)', 'Logistic'};
% %technique = {'C4.5 (pruned no iterations)'; 'C4.5 (unpruned)'; 'C4.5 (pruned)'; 'AdaBoost C4.5 (10x)' ;'AdaBoost C4.5 (25x)'; 'Furia' 'Random Forest (25)'; 'Random Forest (50)'; 'Random Forest (50-5)'; 'LogitBoost Random Forest (10x10)'; 'JRip'; 'AdaBoost JRip (10)' ;'AdaBoost JRip (25)'; 'Bagging C4.5 (25)' ;'Naive Bayes' ;'SVM' ;'kNN'; 'Tuned C4.5 (unpruned)'};
% 
% small  = 40;
% medium = 70;
%     
% 
% %    data = csvread( strcat(num2str(k), '.csv'));
%     
% %     n = N(k);
% %     m = M(k);
% %    m = 1;
%     if m == 4
%         figure('Position', [500, 500, 730, 500]);
%     else
%         figure('Position', [500, 500, 400*m, 250]);
%     end
% 
%     for j = 1:m 
% 
%         if m == 4
%             subplot(2, 2, j);
%         else
%             subplot(1, m, j);
%         end
%         x = data(((j-1)*n + 1):j*n, 1);
%         y = data(((j-1)*n + 1):j*n, 2);
%         for i = 1:length(x)
%             scatter(x(i), y(i), small, type{mymod(i, 13)}, 'LineWidth', 1)
%             hold on;
%         end
%         axis([0 1 0 1])
%         xlabel('precision');
%         ylabel('recall');
%         title(labels{j});
%     end
% 
% %    print(num2str(k),'-djpeg','-r0');
% 
% 
% % subplot(1, 3, 1);
% % for i = 1:length(xNocall)
% %     scatter(xNocall(i), yNocall(i), medium, type{mymod(i, 13)})
% %     hold on;
% % end
% % axis([0 1 0 1])
% % 
% % subplot(1, 3, 2);
% % for i = 1:length(xPoor)
% %     scatter(xPoor(i), yPoor(i), medium, type{mymod(i, 13)})
% %     hold on;
% % end
% % axis([0 1 0 1])
% % 
% % 
% % subplot(1, 3, 3);
% % for i = 1:length(xMedium)
% %     scatter(xMedium(i), yMedium(i), medium, type{mymod(i, 13)});
% %     hold on;
% % end
% % axis([0 1 0 1])
% %columnlegend(3, legend_str, 'Location', 'NorthWest', 'boxon'); 
% %legend('C4.5 (pruned no iterations)', 'C4.5 (unpruned)', 'C4.5 (pruned)', 'AdaBoost C4.5 (10x)', 'AdaBoost C4.5 (25x)', 'Furia', 'Random Forest (25)', 'Random Forest (50)', 'Random Forest (50-5)', 'LogitBoost Random Forest (10x10)', 'JRip', 'AdaBoost JRip (10)', 'AdaBoost JRip (25)', 'Bagging C4.5 (25)', 'Naive Bayes', 'SVM', 'kNN', 'Tuned C4.5 (unpruned)', 'Logistic');
% %legend('C4.5 (unpruned)', 'C4.5 (pruned)', 'AdaBoost C4.5 (10x)', 'AdaBoost C4.5 (25x)', 'Furia', 'Random Forest (25)', 'Random Forest (50)', 'Random Forest (50-5)', 'LogitBoost Random Forest (10x10)', 'JRip', 'AdaBoost JRip (10)', 'AdaBoost JRip (25)', 'Bagging C4.5 (25)', 'Naive Bayes', 'SVM', 'kNN', 'Tuned C4.5 (unpruned)', 'Logistic');
% 
% %legend('Decision Tree','Fuzzy Rule Induction','Random Forest (50)','Rule Induction','Boosted Rule Induction','Naive Bayes', 'SVM','Lazy Learner', 'Tuned Decision Tree', 'Logistic')
% 
% % %gridLegend(mf, 3, technique); 


n = [1, 5, 3, 4];
for a = 1:5
   fprintf('%i \n', sum((a - n).^2) ); 
end
