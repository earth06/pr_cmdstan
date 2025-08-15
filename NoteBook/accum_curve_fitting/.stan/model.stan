data {
    int N_X;
    vector[N_X] y_price;
}
parameters {
    real<lower=0> k;
    real<lower=0> x0;
    real<lower=0> sigma_y;
}
model{
    for (n in 1:N_X)
        y_price[n] ~ normal(10/(1+exp(-k* (n-x0))), sigma_y );
}

generated quantities {
    vector[N_X] y_new;
    for (n in 1:N_X)
        y_new[n] = normal_rng(10/ (1+exp(-k*(n-x0))), sigma_y);
}
