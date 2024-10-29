% Author: Vishnu Gunda / vsg0005@auburn.edu
% Date: 2024-10-29
% Assignment Name: hw04


classdef hw04
    methods (Static)
        function y = p1(data, eval)
            % Implement the divided difference method to interpolate the data points, then evaluate the polynomial at the given point.
            % :param data: a matrix of size n x 2, where the first column is the x values and the second column is the y values
            % :param eval: a column vector of x values at which to evaluate the polynomial
            % :return: a vector of y values corresponding to the evaluation points
        
            n = size(data, 1);  % Number of data points
            x = data(:, 1);     % Extract x values from data
            f = data(:, 2);     % Extract y values from data
        
            % Step 1: Create the divided difference table
            D = zeros(n, n);    % Initialize the divided difference table
            D(:, 1) = f;        % First column is the y values
        
            % Compute the divided differences
            for j = 2:n
                for i = j:n
                    D(i, j) = (D(i, j-1) - D(i-1, j-1)) / (x(i) - x(i-j+1));
                end
            end
        
            % Extract the coefficients (diagonal of the divided difference table)
            coefficients = diag(D);
        
            % Step 2: Evaluate the polynomial at each point in 'eval' using Horner's method
            y = zeros(size(eval)); % Initialize output vector
            for k = 1:length(eval)
                result = coefficients(n); % Start with the highest coefficient
                for i = n-1:-1:1
                    result = result * (eval(k) - x(i)) + coefficients(i);
                end
                y(k) = result; % Store the evaluated result
            end
        end


        function y = p2(data, eval)
            % for 6630 ONLY
            % Implement the divided difference method to interpolate the data 
            % points, then evaluate the polynomial at the given point.
            %
            % :param data: a cell array of size n x 1, each cell is a vector 
            %              like (x, y0, y1, y2, y3, ..., ym). 
            %              y0 = f(x), 
            %              y1 = f'(x), 
            %              y2 = f''(x),
            %              ... ,
            %              ym = f^{(m)}(x).
            % 
            %              Note, different cells may have different lengths.
            %
            % :param eval: a vector of x values at which to evaluate the polynomial
            % :return: a vector of y values corresponding to the evaluation points
        
            n = length(data);
            expanded_x = [];
            expanded_y = [];
            
            % Step 1: Set up repeated data points based on derivatives
            for j = 1:n
                x_j = data{j}(1);         % The x value at this point
                y_j = data{j}(2:end);     % Array of function values and derivatives at x_j
                m_j = length(y_j) - 1;    % Number of derivatives at x_j
                
                % Repeat x_j (m_j + 1) times for each derivative
                expanded_x = [expanded_x; repmat(x_j, m_j + 1, 1)];
                
                % Add the y values including derivatives to expanded_y
                expanded_y = [expanded_y; y_j(:)]; % Ensure y_j is a column vector
            end
        
            % Step 2: Initialize the divided difference table
            table_size = length(expanded_x);
            D = zeros(table_size, table_size); % Divided difference table
            D(:, 1) = expanded_y;              % First column is the values and derivatives
        
            % Step 3: Compute the divided differences
            for k = 2:table_size
                for j = k:table_size
                    if expanded_x(j) == expanded_x(j - k + 1)
                        % Use the derivative information for repeated nodes
                        D(j, k) = D(j, k - 1) / (k - 1);
                    else
                        % Standard divided difference formula
                        D(j, k) = (D(j, k - 1) - D(j - 1, k - 1)) / ...
                                  (expanded_x(j) - expanded_x(j - k + 1));
                    end
                end
            end
        
            % Extract the coefficients from the diagonal of D
            coefficients = diag(D);
        
            % Step 4: Evaluate the polynomial at each point in 'eval' using Horner's method
            y = zeros(size(eval));
            for k = 1:length(eval)
                result = coefficients(end); % Start with the highest-order coefficient
                for i = table_size-1:-1:1
                    result = result * (eval(k) - expanded_x(i)) + coefficients(i);
                end
                y(k) = result; % Store the evaluated result
            end
        end
    end
end
