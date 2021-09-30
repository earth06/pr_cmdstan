data{
    int N;
    int N_2020;
    vector[N] Y;
    vector[N] T;
    vector[N_2020] T_2020;
}

parameters{
  real<lower=0> b;
  real<lower=0> s_y;
  real<lower=0> T0;
}

transformed parameters{
  vector[N] mu;
  for (i in 1:N)
    mu[i] = 2.5^(b*(T[i]-T0));
}

model {
  
  T0 ~normal(20,8);
  Y ~ normal(mu,s_y);
}

generated quantities {
  vector[N_2020] Y_2020;
  for (i in 1:N_2020){
    Y_2020[i] = normal_rng(2.5^(b*(T_2020[i]-T0)),s_y);
  }
}
